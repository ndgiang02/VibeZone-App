import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';
import 'package:vibezone/features/trending/domain/repositories/trending_repository.dart';

class GetTrendingSongsUseCase implements UseCase<TrendingPage, int> {
  static const pageSize = 20;

  final TrendingRepository repository;

  GetTrendingSongsUseCase(this.repository);

  /// Loads chart page [page] (1-based).
  @override
  Future<Either<Failure, TrendingPage>> call(int page) =>
      repository.getTrendingSongs(page: page, pageSize: pageSize);
}
