part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<CityEntity> listCitiesEntity;

  const HomeLoadedState({required this.listCitiesEntity});

  @override
  List<Object> get props => [listCitiesEntity];
}

class HomeFailureState extends HomeState {
  final String msg;

  const HomeFailureState({required this.msg});
}
