import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/trending/data/datasources/trending_remote_data_source.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';
import 'package:vibezone/features/trending/domain/repositories/trending_repository.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  final TrendingRemoteDataSource remote;

  TrendingRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, List<TrendingSong>>> getTrendingSongs(
    TrendingPeriod period,
  ) async {
    try {
      return Right(await remote.getTrendingSongs(period));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
