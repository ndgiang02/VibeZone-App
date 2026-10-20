import 'package:dartz/dartz.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/search/data/datasources/search_local_data_source.dart';
import 'package:vibezone/features/search/data/datasources/search_remote_data_source.dart';
import 'package:vibezone/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  static const _maxRecent = 10;

  final SearchRemoteDataSource remote;
  final SearchLocalDataSource local;

  SearchRepositoryImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, List<Song>>> searchSongs(String query) async {
    try {
      return Right(await remote.searchSongs(query));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getGenres() async {
    try {
      return Right(await remote.getGenres());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getRecentSearches() =>
      _guard(local.getRecentSearches);

  @override
  Future<Either<Failure, List<String>>> saveRecentSearch(String query) =>
      _guard(() async {
        final recent = await local.getRecentSearches();
        recent.removeWhere((e) => e.toLowerCase() == query.toLowerCase());
        final updated = [query, ...recent].take(_maxRecent).toList();
        await local.cacheRecentSearches(updated);
        return updated;
      });

  @override
  Future<Either<Failure, List<String>>> removeRecentSearch(String query) =>
      _guard(() async {
        final updated = (await local.getRecentSearches())..remove(query);
        await local.cacheRecentSearches(updated);
        return updated;
      });

  @override
  Future<Either<Failure, Unit>> clearRecentSearches() => _guard(() async {
    await local.cacheRecentSearches([]);
    return unit;
  });

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    try {
      return Right(await action());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
