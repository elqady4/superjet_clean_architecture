import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/network/netwok_info.dart';
import 'features/available_trips/data/datasources/available_trips_remote_data_source.dart';
import 'features/available_trips/data/repositories/available_trip_repository_impl.dart';
import 'features/available_trips/domain/repositories/available_trip_repository.dart';
import 'features/available_trips/domain/usecases/get_available_trips_usecase.dart';
import 'features/available_trips/presentation/cubit/available_trips_cubit.dart';
import 'features/home/data/datasources/home_remote_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_cities_use_case.dart';
import 'features/home/presentation/cubits/citu_search_cubit/city_search_cubit.dart';
import 'features/home/presentation/cubits/city_text_cubit/city_text_cubit.dart';

import 'features/home/presentation/cubits/retrive_cities_cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!------------ Futures
  //-- Bloc
  sl.registerFactory<HomeCubit>(() => HomeCubit(getCitiesUsecase: sl()));
  sl.registerFactory<CityTextCubit>(() => CityTextCubit());
  sl.registerFactory<CitySearchCubit>(() => CitySearchCubit());
  sl.registerFactory<AvailableTripsCubit>(
      () => AvailableTripsCubit(getAvailableTripsUsecas: sl()));

  //-- Use Cases
  sl.registerLazySingleton<GetCitiesUsecase>(() => GetCitiesUsecase(sl()));
  sl.registerLazySingleton<GetAvailableTripsUsecas>(
      () => GetAvailableTripsUsecas(availableTripsRepository: sl()));

  //-- Repositories
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(networkInfo: sl(), homeRemoteDataSource: sl()));
  sl.registerLazySingleton<AvailableTripsRepository>(() =>
      AvailableTripsRepositoryImpl(
          networkInfo: sl(), availableTripsRemoteDataSource: sl()));

  //-- Data Sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceDIO());
  sl.registerLazySingleton<AvailableTripsRemoteDataSource>(
      () => AvailableTripsRemoteDataSourceDIO());

  //--Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  //--External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}