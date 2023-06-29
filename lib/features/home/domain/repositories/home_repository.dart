import 'package:dartz/dartz.dart';
import '../../../../features/home/domain/entities/city_entitie.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CityEntity>>> getCities();
}
