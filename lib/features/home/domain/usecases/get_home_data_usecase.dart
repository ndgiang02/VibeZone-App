import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/core/usecases/usecase.dart';
import 'package:vibezone/features/home/domain/entities/home_data.dart';
import 'package:vibezone/features/home/domain/repositories/home_repository.dart';

class GetHomeDataUseCase implements UseCase<HomeData, NoParams> {
  final HomeRepository repository;

  GetHomeDataUseCase(this.repository);

  @override
  Future<Either<Failure, HomeData>> call(NoParams params) =>
      repository.getHomeData();
}
