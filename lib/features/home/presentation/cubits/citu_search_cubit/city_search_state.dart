part of 'city_search_cubit.dart';

abstract class CitySearchState extends Equatable {
  const CitySearchState();

  @override
  List<Object> get props => [];
}

class CitySearchInitial extends CitySearchState {}

class CitySearchFound extends CitySearchState {
  final List<CityEntity> cityList;

  const CitySearchFound({required this.cityList});
}

class CitySearchNotFount extends CitySearchState {
  final String msg;

  const CitySearchNotFount({required this.msg});
}
