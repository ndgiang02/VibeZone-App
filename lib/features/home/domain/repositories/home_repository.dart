import 'package:dartz/dartz.dart';
import 'package:vibezone/core/errors/failures.dart';
import 'package:vibezone/features/home/domain/entities/home_data.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeData>> getHomeData();
}
