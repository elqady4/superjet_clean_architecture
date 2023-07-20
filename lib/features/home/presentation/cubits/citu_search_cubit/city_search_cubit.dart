import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';

import '../../../domain/entities/city_entitie.dart';

part 'city_search_state.dart';

class CitySearchCubit extends Cubit<CitySearchState> {
  CitySearchCubit() : super(CitySearchInitial());

  void search(
      List<CityEntity> cityList, String cityQuery, BuildContext context) {
    emit(CitySearchInitial());
    List<CityEntity> cityListSearchResult = cityList
        .where(
            (city) => city.name.toLowerCase().contains(cityQuery.toLowerCase()))
        .toList();
    if (cityListSearchResult.isNotEmpty) {
      emit(CitySearchFound(cityList: cityListSearchResult));
    } else {
      emit(CitySearchNotFount(
          msg: AppLocalizations.of(context)!.translate('notFound')!));
    }
  }

  void restDefult() {
    emit(CitySearchInitial());
  }
}
