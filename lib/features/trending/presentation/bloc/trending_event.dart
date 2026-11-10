part of 'trending_bloc.dart';

@freezed
class TrendingEvent with _$TrendingEvent {
  const factory TrendingEvent.started() = _Started;
  const factory TrendingEvent.refreshed() = _Refreshed;
  const factory TrendingEvent.loadMore() = _LoadMore;
}
