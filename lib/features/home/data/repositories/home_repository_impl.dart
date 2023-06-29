import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/netwok_info.dart';
import '../../domain/entities/city_entitie.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(
      {required this.networkInfo, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<CityEntity>>> getCities() async {
    if (await networkInfo.isConnected) {
      try {
        var result = await homeRemoteDataSource.getCities();
        return Right(result);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
