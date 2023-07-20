import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import '../../../../../core/errors/failure.dart';
import '../../../domain/entities/city_entitie.dart';
import '../../../domain/usecases/get_cities_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCitiesUsecase getCitiesUsecase;
  String? cityFrom;
  String? cityto;
  String? tripDate;
  HomeCubit({required this.getCitiesUsecase}) : super(HomeInitialState());

  Future<void> getCities(BuildContext context) async {
    emit(HomeLoadingState());
    Either<Failure, List<CityEntity>> response = await getCitiesUsecase(unit);
    emit(response.fold(
        (failure) => HomeFailureState(msg: _mapFailureToMsg(failure, context)),
        (cities) => HomeLoadedState(listCitiesEntity: cities)));
  }

  String _mapFailureToMsg(Failure failure, BuildContext context) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppLocalizations.of(context)!.translate('serverFailure')!;
      case CacheFailure:
        return AppLocalizations.of(context)!.translate('cacheFailure')!;

      default:
        return AppLocalizations.of(context)!.translate('unexpectedError')!;
    }
  }
}
