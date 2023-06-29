import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/city_entitie.dart';
import '../../../domain/usecases/get_cities_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCitiesUsecase getCitiesUsecase;
  String? cityFrom;
  String? cityto;
  String? tripDate;
  HomeCubit({required this.getCitiesUsecase}) : super(HomeInitialState());

  Future<void> getCities() async {
    emit(HomeLoadingState());
    Either<Failure, List<CityEntity>> response = await getCitiesUsecase(unit);
    emit(response.fold(
        (failure) => HomeFailureState(msg: _mapFailureToMsg(failure)),
        (cities) => HomeLoadedState(listCitiesEntity: cities)));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unexpectedError;
    }
  }
}
