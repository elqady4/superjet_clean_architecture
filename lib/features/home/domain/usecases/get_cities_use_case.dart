import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/city_entitie.dart';
import '../repositories/home_repository.dart';

class GetCitiesUsecase extends Usecase<List<CityEntity>, Unit> {
  final HomeRepository homeRepository;

  GetCitiesUsecase(this.homeRepository);
  @override
  Future<Either<Failure, List<CityEntity>>> call(Unit params) {
    return homeRepository.getCities();
  }
}
