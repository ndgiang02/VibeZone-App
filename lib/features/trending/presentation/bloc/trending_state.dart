part of 'trending_bloc.dart';

@freezed
abstract class TrendingState with _$TrendingState {
  const TrendingState._();

  const factory TrendingState({
    @Default(PageState.init) PageState status,
    @Default(<TrendingSong>[]) List<TrendingSong> songs,

    /// Last page loaded (1-based); 0 before the first one.
    @Default(0) int page,
    @Default(false) bool hasMore,
  }) = _TrendingState;

  bool get isLoadingMore => status == PageState.loadMore;

  /// The podium needs three songs; a shorter chart is shown as a plain list.
  List<TrendingSong> get topThree =>
      songs.length >= 3 ? songs.take(3).toList() : const [];

  List<TrendingSong> get others => songs.skip(topThree.length).toList();
}
