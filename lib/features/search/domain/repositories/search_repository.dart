import 'package:dartz/dartz.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/errors/failures.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<Song>>> searchSongs(String query);

  Future<Either<Failure, List<String>>> getGenres();

  Future<Either<Failure, List<String>>> getRecentSearches();

  /// Returns the updated history.
  Future<Either<Failure, List<String>>> saveRecentSearch(String query);

  Future<Either<Failure, List<String>>> removeRecentSearch(String query);

  Future<Either<Failure, Unit>> clearRecentSearches();
}
