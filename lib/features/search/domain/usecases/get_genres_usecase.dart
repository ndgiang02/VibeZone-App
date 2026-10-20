import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/search/domain/repositories/search_repository.dart';

class GetGenresUseCase implements UseCase<List<String>, NoParams> {
  final SearchRepository repository;

  GetGenresUseCase(this.repository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) =>
      repository.getGenres();
}
