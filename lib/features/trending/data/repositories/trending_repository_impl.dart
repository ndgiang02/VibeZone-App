import 'package:dartz/dartz.dart';
import 'package:vibezone/core/configs/constants/errors.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/trending/data/datasources/trending_remote_data_source.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';
import 'package:vibezone/features/trending/domain/repositories/trending_repository.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  final TrendingRemoteDataSource remote;

  TrendingRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, TrendingPage>> getTrendingSongs({
    required int page,
    required int pageSize,
  }) async {
    try {
      return Right(
        await remote.getTrendingSongs(page: page, pageSize: pageSize),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure(unknownError));
    }
  }
}
