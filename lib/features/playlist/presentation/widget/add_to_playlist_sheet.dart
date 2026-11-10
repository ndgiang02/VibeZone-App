import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/app_image.dart';
import 'package:vibezone/core/common/widgets/custom_textfield.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/utils/error_message.dart';
import 'package:vibezone/features/playlist/domain/entities/my_playlist.dart';
import 'package:vibezone/injection.dart';

import '../cubit/add_to_playlist_cubit.dart';

/// Lists the user's playlists with a check on those that have [song].
Future<void> showAddToPlaylistSheet(BuildContext context, Song song) {
  return showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => BlocProvider(
      create: (_) => getIt<AddToPlaylistCubit>(param1: song.id)..load(),
      child: _AddToPlaylistSheet(song: song),
    ),
  );
}

class _AddToPlaylistSheet extends StatelessWidget {
  final Song song;

  const _AddToPlaylistSheet({required this.song});

  Future<void> _create(BuildContext context) async {
    final cubit = context.read<AddToPlaylistCubit>();
    final result = await showDialog<(String, bool)>(
      context: context,
      builder: (_) => const _NewPlaylistDialog(),
    );
    if (result != null) await cubit.create(result.$1, isPublic: result.$2);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.7,
      ),
      child: SafeArea(
        child: BlocBuilder<AddToPlaylistCubit, AddToPlaylistState>(
          builder: (context, state) {
            final cubit = context.read<AddToPlaylistCubit>();
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
                  child: Text(
                    s.title_add_to_playlist,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    song.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                if (state.error != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                    child: Text(
                      errorMessage(context, state.error!),
                      style: TextStyle(color: theme.colorScheme.error),
                    ),
                  ),
                ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: state.isCreating
                        ? const Padding(
                            padding: EdgeInsets.all(14),
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(
                            Icons.add_rounded,
                            color: theme.colorScheme.primary,
                          ),
                  ),
                  title: Text(s.btn_new_playlist),
                  onTap: state.isCreating ? null : () => _create(context),
                ),
                const Divider(height: 1),
                Flexible(child: _list(context, state, cubit)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _list(
    BuildContext context,
    AddToPlaylistState state,
    AddToPlaylistCubit cubit,
  ) {
    final s = S.of(context);
    switch (state.status) {
      case PageState.init:
      case PageState.loading:
        return const Padding(
          padding: EdgeInsets.all(32),
          child: Center(child: CircularProgressIndicator()),
        );
      case PageState.empty:
        return Padding(
          padding: const EdgeInsets.all(32),
          child: Text(s.txt_no_playlists, textAlign: TextAlign.center),
        );
      case PageState.error when state.playlists.isEmpty:
        return Center(
          child: TextButton(onPressed: cubit.load, child: Text(s.btn_retry)),
        );
      default:
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.playlists.length,
          itemBuilder: (context, index) {
            final playlist = state.playlists[index];
            return _PlaylistTile(
              playlist: playlist,
              isBusy: state.busyIds.contains(playlist.id),
              onTap: () => cubit.toggle(playlist),
            );
          },
        );
    }
  }
}

class _PlaylistTile extends StatelessWidget {
  final MyPlaylist playlist;
  final bool isBusy;
  final VoidCallback onTap;

  const _PlaylistTile({
    required this.playlist,
    required this.isBusy,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final cover = playlist.coverUrls.firstOrNull ?? '';
    return ListTile(
      onTap: isBusy ? null : onTap,
      leading: AppImage(
        url: cover,
        width: 48,
        height: 48,
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(playlist.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Row(
        children: [
          if (!playlist.isPublic) ...[
            const Icon(Icons.lock_outline_rounded, size: 14),
            const SizedBox(width: 4),
          ],
          Text('${playlist.trackCount} ${S.of(context).txt_songs}'),
        ],
      ),
      trailing: Icon(
        playlist.containsTrack
            ? Icons.check_circle_rounded
            : Icons.add_circle_outline_rounded,
        color: playlist.containsTrack
            ? scheme.primary
            : scheme.onSurfaceVariant,
      ),
    );
  }
}

/// Resolves to (title, isPublic), or `null` when cancelled.
class _NewPlaylistDialog extends StatefulWidget {
  const _NewPlaylistDialog();

  @override
  State<_NewPlaylistDialog> createState() => _NewPlaylistDialogState();
}

class _NewPlaylistDialogState extends State<_NewPlaylistDialog> {
  final _title = TextEditingController();
  bool _isPublic = false;
  String? _error;

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  void _submit() {
    final title = _title.text.trim();
    if (title.isEmpty) {
      setState(() => _error = S.of(context).err_title_required);
      return;
    }
    Navigator.pop(context, (title, _isPublic));
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return AlertDialog(
      title: Text(s.btn_new_playlist),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            ctr: _title,
            hintText: s.hint_playlist_title,
            error: _error,
            maxLength: 100,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.done,
          ),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: Text(s.txt_public_playlist),
            value: _isPublic,
            onChanged: (value) => setState(() => _isPublic = value),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(s.txt_cancel),
        ),
        FilledButton(onPressed: _submit, child: Text(s.btn_create)),
      ],
    );
  }
}
