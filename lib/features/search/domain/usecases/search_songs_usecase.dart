import 'package:dartz/dartz.dart';
import 'package:vibezone/core/common/entities/song.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/search/domain/repositories/search_repository.dart';

class SearchSongsUseCase implements UseCase<List<Song>, String> {
  final SearchRepository repository;

  SearchSongsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Song>>> call(String query) {
    final keyword = query.trim();
    if (keyword.isEmpty) return Future.value(const Right(<Song>[]));
    return repository.searchSongs(keyword);
  }
}
