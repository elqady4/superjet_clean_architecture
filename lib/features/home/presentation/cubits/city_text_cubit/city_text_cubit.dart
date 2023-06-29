import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'city_text_state.dart';

class CityTextCubit extends Cubit<CityTextState> {
  CityTextCubit() : super(CityTextInitial());

  String cityFrom = '';
  String cityTo = '';
  String date = '';

  changeCity(String cityName, int anyWidget) {
    emit(CityTextInitial());
    if (anyWidget == 1) {
      cityFrom = cityName;
    } else {
      cityTo = cityName;
    }
    emit(CityTextChange());
  }

  void switchCities() {
    if (cityFrom.isNotEmpty || cityTo.isNotEmpty) {
      emit(CityTextInitial());
      String temp = cityFrom;
      cityFrom = cityTo;
      cityTo = temp;
      emit(CityTextChange());
    }
  }
}
