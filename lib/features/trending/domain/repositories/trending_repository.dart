import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/trending/domain/entities/trending_song.dart';

abstract class TrendingRepository {
  Future<Either<Failure, TrendingPage>> getTrendingSongs({
    required int page,
    required int pageSize,
  });
}
