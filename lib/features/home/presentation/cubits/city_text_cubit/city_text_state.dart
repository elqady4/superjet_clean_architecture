part of 'city_text_cubit.dart';

abstract class CityTextState extends Equatable {
  const CityTextState();

  @override
  List<Object> get props => [];
}

class CityTextInitial extends CityTextState {}

class CityTextChange extends CityTextState {}
