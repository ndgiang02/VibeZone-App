part of 'upload_bloc.dart';

enum UploadPhase {
  /// Filling in the form.
  idle,
  uploading,

  /// Uploaded; the server is transcoding the audio.
  processing,
  completed,
  failed,
}

@freezed
abstract class UploadState with _$UploadState {
  const UploadState._();

  const factory UploadState({
    /// Loading the artist profile and genres.
    @Default(PageState.init) PageState status,

    /// `null` until the user creates one.
    ArtistProfile? artist,
    @Default(false) bool isCreatingArtist,
    @Default(<Genre>[]) List<Genre> genres,
    @Default('') String title,
    @Default('') String description,
    Genre? genre,
    @Default(TrackVisibility.public) TrackVisibility visibility,
    String? audioPath,
    String? artworkPath,
    @Default(UploadPhase.idle) UploadPhase phase,

    /// 0..1 of the bytes sent.
    @Default(0.0) double progress,

    /// Processing error code when [phase] is [UploadPhase.failed].
    String? processingError,
    String? errTitle,
    String? errAudio,
    PageCommand? pageCommand,
  }) = _UploadState;

  bool get isBusy =>
      phase == UploadPhase.uploading || phase == UploadPhase.processing;
}
