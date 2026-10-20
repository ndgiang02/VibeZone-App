import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/search/domain/repositories/search_repository.dart';

class GetRecentSearchesUseCase implements UseCase<List<String>, NoParams> {
  final SearchRepository repository;

  GetRecentSearchesUseCase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) =>
      repository.getRecentSearches();
}

class SaveRecentSearchUseCase implements UseCase<List<String>, String> {
  final SearchRepository repository;

  SaveRecentSearchUseCase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(String query) =>
      repository.saveRecentSearch(query.trim());
}

class RemoveRecentSearchUseCase implements UseCase<List<String>, String> {
  final SearchRepository repository;

  RemoveRecentSearchUseCase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(String query) =>
      repository.removeRecentSearch(query);
}

class ClearRecentSearchesUseCase implements UseCase<Unit, NoParams> {
  final SearchRepository repository;

  ClearRecentSearchesUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) =>
      repository.clearRecentSearches();
}
