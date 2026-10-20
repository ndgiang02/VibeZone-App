part of 'trending_bloc.dart';

@freezed
abstract class TrendingState with _$TrendingState {
  const TrendingState._();

  const factory TrendingState({
    @Default(PageState.init) PageState status,
    @Default(TrendingPeriod.today) TrendingPeriod period,
    @Default(<TrendingSong>[]) List<TrendingSong> songs,
    String? errorMessage,
  }) = _TrendingState;

  List<TrendingSong> get topThree => songs.take(3).toList();

  List<TrendingSong> get others => songs.skip(3).toList();
}
