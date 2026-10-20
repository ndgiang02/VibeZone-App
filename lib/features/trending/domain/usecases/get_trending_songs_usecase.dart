import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';
import 'package:vibezone/features/trending/domain/repositories/trending_repository.dart';

class GetTrendingSongsUseCase
    implements UseCase<List<TrendingSong>, TrendingPeriod> {
  final TrendingRepository repository;

  GetTrendingSongsUseCase(this.repository);

  @override
  Future<Either<Failure, List<TrendingSong>>> call(TrendingPeriod period) =>
      repository.getTrendingSongs(period);
}
