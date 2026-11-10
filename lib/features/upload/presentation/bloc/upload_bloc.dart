import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibezone/core/configs/constants/errors.dart';
import 'package:vibezone/core/state/bloc/page_command.dart';
import 'package:vibezone/core/state/bloc/page_state.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/upload/domain/entities/upload_entities.dart';
import 'package:vibezone/features/upload/domain/usecases/upload_usecases.dart';

part 'upload_bloc.freezed.dart';
part 'upload_event.dart';
part 'upload_state.dart';

/// Uploads a track in one request, then polls until the server has
/// processed the audio.
class UploadBloc extends Bloc<UploadEvent, UploadState> {
  static const _pollInterval = Duration(seconds: 3);

  final GetMyArtistUseCase _getMyArtist;
  final GetUploadGenresUseCase _getGenres;
  final BecomeArtistUseCase _becomeArtist;
  final UploadTrackUseCase _uploadTrack;
  final GetUploadStatusUseCase _getUploadStatus;

  UploadBloc(
    this._getMyArtist,
    this._getGenres,
    this._becomeArtist,
    this._uploadTrack,
    this._getUploadStatus,
  ) : super(const UploadState()) {
    on<_Started>(_onStarted);
    on<_BecomeArtist>(_onBecomeArtist);
    on<_TitleChanged>(
      (event, emit) => emit(state.copyWith(title: event.title, errTitle: null)),
    );
    on<_DescriptionChanged>(
      (event, emit) => emit(state.copyWith(description: event.description)),
    );
    on<_GenreSelected>(
      (event, emit) => emit(state.copyWith(genre: event.genre)),
    );
    on<_VisibilityChanged>(
      (event, emit) => emit(state.copyWith(visibility: event.visibility)),
    );
    on<_AudioPicked>(_onAudioPicked);
    on<_ArtworkPicked>(
      (event, emit) => emit(state.copyWith(artworkPath: event.path)),
    );
    on<_Submit>(_onSubmit);
    on<_Reset>(_onReset);
    on<_OnClearPage>((event, emit) => emit(state.copyWith(pageCommand: null)));
    on<_Progress>(_onProgress);
  }

  Future<void> _onStarted(_Started event, Emitter<UploadState> emit) async {
    emit(state.copyWith(status: PageState.loading));
    final (artist, genres) = await (
      _getMyArtist(const NoParams()),
      _getGenres(const NoParams()),
    ).wait;
    artist.fold(
      (failure) => emit(
        state.copyWith(
          status: PageState.error,
          pageCommand: PageCommandShowError(failure.message),
        ),
      ),
      (artist) => emit(
        state.copyWith(
          status: PageState.success,
          artist: artist,
          // The form still works without genres.
          genres: genres.getOrElse(() => const []),
        ),
      ),
    );
  }

  Future<void> _onBecomeArtist(
    _BecomeArtist event,
    Emitter<UploadState> emit,
  ) async {
    emit(state.copyWith(isCreatingArtist: true));
    final result = await _becomeArtist(
      BecomeArtistParams(slug: event.slug, name: event.name),
    );
    result.fold(
      (failure) => emit(
        state.copyWith(
          isCreatingArtist: false,
          pageCommand: PageCommandShowError(failure.message),
        ),
      ),
      (artist) => emit(state.copyWith(isCreatingArtist: false, artist: artist)),
    );
  }

  void _onAudioPicked(_AudioPicked event, Emitter<UploadState> emit) {
    // Suggest the file name as the title.
    final title = state.title.isNotEmpty
        ? state.title
        : event.path
              .split(RegExp(r'[/\\]'))
              .last
              .replaceFirst(RegExp(r'\.[^.]+$'), '')
              .replaceAll('_', ' ');
    emit(state.copyWith(audioPath: event.path, title: title, errAudio: null));
  }

  void _onProgress(_Progress event, Emitter<UploadState> emit) {
    if (state.phase != UploadPhase.uploading || event.total <= 0) return;
    emit(state.copyWith(progress: event.sent / event.total));
  }

  Future<void> _onSubmit(_Submit event, Emitter<UploadState> emit) async {
    if (state.isBusy) return;
    final title = state.title.trim();
    final errTitle = title.isEmpty ? trackTitleInvalid : null;
    final errAudio = state.audioPath == null ? audioRequired : null;
    if (errTitle != null || errAudio != null) {
      emit(state.copyWith(errTitle: errTitle, errAudio: errAudio));
      return;
    }

    emit(state.copyWith(phase: UploadPhase.uploading, progress: 0));
    final result = await _uploadTrack(
      UploadTrackParams(
        TrackUploadRequest(
          title: title,
          description: state.description,
          genreSlug: state.genre?.slug,
          visibility: state.visibility,
          audioPath: state.audioPath!,
          artworkPath: state.artworkPath,
        ),
        onProgress: (sent, total) {
          if (!isClosed) add(UploadEvent.progress(sent, total));
        },
      ),
    );
    final upload = result.fold((failure) {
      emit(
        state.copyWith(
          phase: UploadPhase.idle,
          pageCommand: PageCommandShowError(failure.message),
        ),
      );
      return null;
    }, (upload) => upload);
    if (upload == null) return;

    emit(state.copyWith(phase: UploadPhase.processing, progress: 1));
    await _waitForProcessing(upload, emit);
  }

  Future<void> _waitForProcessing(
    UploadProgress upload,
    Emitter<UploadState> emit,
  ) async {
    var current = upload;
    while (!current.status.isFinished) {
      await Future.delayed(_pollInterval);
      if (isClosed || state.phase != UploadPhase.processing) return;
      final result = await _getUploadStatus(current.trackId);
      // A dropped connection just waits for the next poll.
      current = result.getOrElse(() => current);
    }
    emit(
      state.copyWith(
        phase: current.status == UploadStatus.completed
            ? UploadPhase.completed
            : UploadPhase.failed,
        processingError: current.errorCode,
      ),
    );
  }

  void _onReset(_Reset event, Emitter<UploadState> emit) {
    emit(
      UploadState(
        status: state.status,
        artist: state.artist,
        genres: state.genres,
        visibility: state.visibility,
      ),
    );
  }
}
