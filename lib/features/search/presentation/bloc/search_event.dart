part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.started() = _Started;
  const factory SearchEvent.queryChanged(String query) = _QueryChanged;

  /// Keyboard "search", a tapped recent search or genre: also saved to history.
  const factory SearchEvent.submitted(String query) = _Submitted;
  const factory SearchEvent.removeRecent(String query) = _RemoveRecent;
  const factory SearchEvent.clearRecent() = _ClearRecent;
}
