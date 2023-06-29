import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../domain/entities/city_entitie.dart';

part 'city_search_state.dart';

class CitySearchCubit extends Cubit<CitySearchState> {
  CitySearchCubit() : super(CitySearchInitial());

  void search(List<CityEntity> cityList, String cityQuery) {
    emit(CitySearchInitial());
    List<CityEntity> cityListSearchResult = cityList
        .where(
            (city) => city.name.toLowerCase().contains(cityQuery.toLowerCase()))
        .toList();
    if (cityListSearchResult.isNotEmpty) {
      emit(CitySearchFound(cityList: cityListSearchResult));
    } else {
      emit(const CitySearchNotFount(msg: AppStrings.notFound));
    }
  }

  void restDefult() {
    emit(CitySearchInitial());
  }
}
