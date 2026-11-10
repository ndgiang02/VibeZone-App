part of 'upload_bloc.dart';

@freezed
class UploadEvent with _$UploadEvent {
  const factory UploadEvent.started() = _Started;
  const factory UploadEvent.becomeArtist({
    required String name,
    required String slug,
  }) = _BecomeArtist;
  const factory UploadEvent.titleChanged(String title) = _TitleChanged;
  const factory UploadEvent.descriptionChanged(String description) =
      _DescriptionChanged;
  const factory UploadEvent.genreSelected(Genre? genre) = _GenreSelected;
  const factory UploadEvent.visibilityChanged(TrackVisibility visibility) =
      _VisibilityChanged;
  const factory UploadEvent.audioPicked(String path) = _AudioPicked;
  const factory UploadEvent.artworkPicked(String? path) = _ArtworkPicked;
  const factory UploadEvent.submit() = _Submit;

  /// Clears the form to upload another track.
  const factory UploadEvent.reset() = _Reset;
  const factory UploadEvent.onClearPage() = _OnClearPage;

  // Reported while uploading.
  const factory UploadEvent.progress(int sent, int total) = _Progress;
}
