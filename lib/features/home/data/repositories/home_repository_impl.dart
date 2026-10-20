import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/exceptions.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/home/data/datasources/home_remote_data_source.dart';
import 'package:vibezone/features/home/domain/entities/home_data.dart';
import 'package:vibezone/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;

  HomeRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, HomeData>> getHomeData() async {
    try {
      return Right(await remote.getHomeData());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
