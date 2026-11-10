import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/custom_textfield.dart';
import 'package:vibezone/core/common/widgets/primary_button.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/storage/session_controller.dart';
import 'package:vibezone/core/utils/error_message.dart';
import 'package:vibezone/core/utils/responsive.dart';
import 'package:vibezone/core/utils/snackbar_utils.dart';
import 'package:vibezone/features/upload/domain/entities/upload_entities.dart';
import 'package:vibezone/injection.dart';

import 'bloc/upload_bloc.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UploadBloc>()..add(const UploadEvent.started()),
      child: const _UploadView(),
    );
  }
}

class _UploadView extends StatelessWidget {
  const _UploadView();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final padding = Responsive.horizontalPadding(
      context,
      maxWidth: Breakpoints.form,
    );
    return BlocListener<UploadBloc, UploadState>(
      listenWhen: (p, c) =>
          c.pageCommand != null && p.pageCommand != c.pageCommand,
      listener: (context, state) {
        final command = state.pageCommand;
        if (command is PageCommandShowError) {
          SnackBarUtils.show(
            context,
            errorMessage(context, command.msg),
            isError: true,
          );
        }
        context.read<UploadBloc>().add(const UploadEvent.onClearPage());
      },
      child: Scaffold(
        appBar: AppBar(title: Text(s.title_upload), centerTitle: true),
        body: SafeArea(
          child: BlocBuilder<UploadBloc, UploadState>(
            buildWhen: (p, c) =>
                p.status != c.status ||
                p.artist != c.artist ||
                p.phase != c.phase,
            builder: (context, state) {
              final Widget child;
              if (state.status == PageState.loading ||
                  state.status == PageState.init) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == PageState.error) {
                return Center(
                  child: TextButton(
                    onPressed: () => context.read<UploadBloc>().add(
                      const UploadEvent.started(),
                    ),
                    child: Text(s.btn_retry),
                  ),
                );
              } else if (state.artist == null) {
                child = const _BecomeArtistForm();
              } else if (state.phase == UploadPhase.completed ||
                  state.phase == UploadPhase.failed) {
                child = _UploadResult(
                  failed: state.phase == UploadPhase.failed,
                );
              } else {
                child = const _UploadForm();
              }
              return SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(padding, Spacing.x4, padding, 24),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _BecomeArtistForm extends StatefulWidget {
  const _BecomeArtistForm();

  @override
  State<_BecomeArtistForm> createState() => _BecomeArtistFormState();
}

class _BecomeArtistFormState extends State<_BecomeArtistForm> {
  static final _slugPattern = RegExp(r'^[a-z0-9_-]{3,30}$');

  final _name = TextEditingController(text: SessionController().user.username);
  final _slug = TextEditingController(text: SessionController().user.handle);
  String? _errName;
  String? _errSlug;

  @override
  void dispose() {
    _name.dispose();
    _slug.dispose();
    super.dispose();
  }

  void _submit() {
    final s = S.of(context);
    final name = _name.text.trim();
    final slug = _slug.text.trim().toLowerCase();
    setState(() {
      _errName = name.isEmpty ? s.err_name_required : null;
      _errSlug = _slugPattern.hasMatch(slug) ? null : s.err_slug_invalid;
    });
    if (_errName != null || _errSlug != null) return;
    FocusScope.of(context).unfocus();
    context.read<UploadBloc>().add(
      UploadEvent.becomeArtist(name: name, slug: slug),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    final isLoading = context.select(
      (UploadBloc b) => b.state.isCreatingArtist,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          Icons.mic_external_on_rounded,
          size: 64,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(height: Spacing.x4),
        Text(
          s.title_become_artist,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge,
        ),
        const SizedBox(height: Spacing.x3),
        Text(
          s.txt_become_artist_desc,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: Spacing.x5),
        CustomTextField(
          ctr: _name,
          hintText: s.hint_artist_name,
          error: _errName,
          maxLength: 100,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          prefixWidget: const Icon(Icons.person_outline_rounded),
        ),
        const SizedBox(height: Spacing.x4),
        CustomTextField(
          ctr: _slug,
          hintText: s.hint_artist_slug,
          error: _errSlug,
          maxLength: 30,
          textInputAction: TextInputAction.done,
          prefixWidget: const Icon(Icons.link_rounded),
        ),
        const SizedBox(height: Spacing.x5),
        PrimaryButton(
          text: s.btn_create_artist,
          isLoading: isLoading,
          onPressed: _submit,
        ),
      ],
    );
  }
}

class _UploadForm extends StatefulWidget {
  const _UploadForm();

  @override
  State<_UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<_UploadForm> {
  static const _audioExtensions = [
    'mp3',
    'wav',
    'flac',
    'aac',
    'm4a',
    'ogg',
    'opus',
  ];

  late final _title = TextEditingController(
    text: context.read<UploadBloc>().state.title,
  );

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  Future<void> _pickAudio() async {
    // Custom extensions so iOS opens Files, not only the music library.
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: _audioExtensions,
    );
    final path = result?.files.single.path;
    if (path != null && mounted) {
      context.read<UploadBloc>().add(UploadEvent.audioPicked(path));
    }
  }

  Future<void> _pickArtwork() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 2000,
      maxHeight: 2000,
      imageQuality: 90,
    );
    if (image != null && mounted) {
      context.read<UploadBloc>().add(UploadEvent.artworkPicked(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final bloc = context.read<UploadBloc>();
    return BlocConsumer<UploadBloc, UploadState>(
      // The title is suggested from the audio file name.
      listenWhen: (p, c) => p.title != c.title && c.title != _title.text,
      listener: (context, state) => _title.text = state.title,
      builder: (context, state) {
        final enabled = !state.isBusy;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: _ArtworkPicker(
                path: state.artworkPath,
                onPick: enabled ? _pickArtwork : null,
                onRemove: enabled
                    ? () => bloc.add(const UploadEvent.artworkPicked(null))
                    : null,
              ),
            ),
            const SizedBox(height: Spacing.x5),
            _AudioPicker(
              path: state.audioPath,
              error: state.errAudio == null
                  ? null
                  : errorMessage(context, state.errAudio!),
              onPick: enabled ? _pickAudio : null,
            ),
            const SizedBox(height: Spacing.x4),
            CustomTextField(
              ctr: _title,
              hintText: s.hint_track_title,
              error: state.errTitle == null
                  ? null
                  : errorMessage(context, state.errTitle!),
              maxLength: 200,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.next,
              prefixWidget: const Icon(Icons.music_note_rounded),
              onChanged: (value) => bloc.add(UploadEvent.titleChanged(value)),
            ),
            const SizedBox(height: Spacing.x4),
            CustomTextField(
              hintText: s.hint_description,
              maxLength: 2000,
              textCapitalization: TextCapitalization.sentences,
              prefixWidget: const Icon(Icons.notes_rounded),
              onChanged: (value) =>
                  bloc.add(UploadEvent.descriptionChanged(value)),
            ),
            const SizedBox(height: Spacing.x4),
            DropdownButtonFormField<Genre?>(
              initialValue: state.genre,
              decoration: InputDecoration(labelText: s.label_genre),
              items: [
                DropdownMenuItem(value: null, child: Text(s.txt_no_genre)),
                for (final genre in state.genres)
                  DropdownMenuItem(value: genre, child: Text(genre.name)),
              ],
              onChanged: enabled
                  ? (genre) => bloc.add(UploadEvent.genreSelected(genre))
                  : null,
            ),
            const SizedBox(height: Spacing.x4),
            Text(
              s.label_visibility,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: Spacing.x3),
            SegmentedButton<TrackVisibility>(
              segments: [
                ButtonSegment(
                  value: TrackVisibility.public,
                  icon: const Icon(Icons.public_rounded),
                  label: Text(s.txt_visibility_public),
                ),
                ButtonSegment(
                  value: TrackVisibility.unlisted,
                  icon: const Icon(Icons.link_rounded),
                  label: Text(s.txt_visibility_unlisted),
                ),
                ButtonSegment(
                  value: TrackVisibility.private,
                  icon: const Icon(Icons.lock_outline_rounded),
                  label: Text(s.txt_visibility_private),
                ),
              ],
              selected: {state.visibility},
              onSelectionChanged: enabled
                  ? (selected) =>
                        bloc.add(UploadEvent.visibilityChanged(selected.first))
                  : null,
            ),
            const SizedBox(height: Spacing.x6),
            if (state.isBusy)
              _UploadProgress(state: state)
            else
              PrimaryButton(
                text: s.btn_upload,
                icon: const Icon(Icons.cloud_upload_rounded),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  bloc.add(const UploadEvent.submit());
                },
              ),
          ],
        );
      },
    );
  }
}

class _ArtworkPicker extends StatelessWidget {
  static const _size = 160.0;

  final String? path;
  final VoidCallback? onPick;
  final VoidCallback? onRemove;

  const _ArtworkPicker({this.path, this.onPick, this.onRemove});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        InkWell(
          onTap: onPick,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: _size,
            height: _size,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: scheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
            ),
            child: path == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 40,
                        color: scheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 8),
                      Text(S.of(context).btn_choose_cover),
                    ],
                  )
                : Image.file(File(path!), fit: BoxFit.cover),
          ),
        ),
        if (path != null && onRemove != null)
          Positioned(
            top: 4,
            right: 4,
            child: IconButton.filledTonal(
              iconSize: 18,
              icon: const Icon(Icons.close_rounded),
              onPressed: onRemove,
            ),
          ),
      ],
    );
  }
}

class _AudioPicker extends StatelessWidget {
  final String? path;
  final String? error;
  final VoidCallback? onPick;

  const _AudioPicker({this.path, this.error, this.onPick});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final name = path?.split(RegExp(r'[/\\]')).last;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          child: ListTile(
            onTap: onPick,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: error == null
                  ? BorderSide.none
                  : BorderSide(color: scheme.error),
            ),
            leading: Icon(Icons.audio_file_rounded, color: scheme.primary),
            title: Text(
              name ?? S.of(context).btn_choose_audio,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: name == null
                ? const Text('MP3, WAV, FLAC, AAC, M4A, OGG, Opus · ≤ 200 MB')
                : null,
            trailing: const Icon(Icons.folder_open_rounded),
          ),
        ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Text(
              error!,
              style: theme.textTheme.labelSmall!.copyWith(
                color: scheme.error,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}

class _UploadProgress extends StatelessWidget {
  final UploadState state;

  const _UploadProgress({required this.state});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isUploading = state.phase == UploadPhase.uploading;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(isUploading ? s.txt_uploading : s.txt_processing),
            ),
            if (isUploading) Text('${(state.progress * 100).round()}%'),
          ],
        ),
        const SizedBox(height: Spacing.x3),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            minHeight: 8,
            // Processing has no measurable progress.
            value: isUploading ? state.progress : null,
          ),
        ),
      ],
    );
  }
}

class _UploadResult extends StatelessWidget {
  final bool failed;

  const _UploadResult({required this.failed});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    final error = context.select((UploadBloc b) => b.state.processingError);
    return Column(
      children: [
        const SizedBox(height: Spacing.x6),
        Icon(
          failed ? Icons.error_outline_rounded : Icons.check_circle_rounded,
          size: 80,
          color: failed ? theme.colorScheme.error : theme.colorScheme.primary,
        ),
        const SizedBox(height: Spacing.x4),
        Text(
          failed ? s.msg_upload_failed : s.msg_upload_completed,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium,
        ),
        if (failed && error != null) ...[
          const SizedBox(height: Spacing.x3),
          Text(error, style: theme.textTheme.bodySmall),
        ],
        const SizedBox(height: Spacing.x6),
        PrimaryButton(
          text: s.btn_upload_another,
          onPressed: () =>
              context.read<UploadBloc>().add(const UploadEvent.reset()),
        ),
      ],
    );
  }
}
