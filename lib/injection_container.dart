import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:suberjet_clean_architecture/features/available_trips/data/datasources/available_seats_remote.dart';
import 'package:suberjet_clean_architecture/features/available_trips/data/repositories/available_seats_repository_impl.dart';
import 'package:suberjet_clean_architecture/features/available_trips/domain/usecases/get_available_seats_usecase.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/cubites/available_seats/available_seats_cubit.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_first_token_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_order_id_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_payment_key_card_remote_data_source.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_payment_key_wallet_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_wallet_url_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/repositories/payment_repository.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_first_token_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_order_id_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_payment_key_card_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_payment_key_wallet_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_wallet_url_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubites/card_payment_cubit/cubit/card_payment_cubit.dart';
import 'core/network/netwok_info.dart';
import 'features/available_trips/data/datasources/available_trips_remote_data_source.dart';
import 'features/available_trips/data/repositories/available_trip_repository_impl.dart';
import 'features/available_trips/domain/repositories/available_seats_repository.dart';
import 'features/available_trips/domain/repositories/available_trip_repository.dart';
import 'features/available_trips/domain/usecases/get_available_trips_usecase.dart';
import 'features/available_trips/presentation/cubites/available_trips/available_trips_cubit.dart';
import 'features/home/data/datasources/home_remote_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_cities_use_case.dart';
import 'features/home/presentation/cubits/citu_search_cubit/city_search_cubit.dart';
import 'features/home/presentation/cubits/city_text_cubit/city_text_cubit.dart';

import 'features/home/presentation/cubits/retrive_cities_cubit/home_cubit.dart';
import 'features/payment/presentation/cubites/payment_method_cubit/payment_method_cubit.dart';
import 'features/payment/presentation/cubites/wallet_payment_cubit/cubit/wallet_payment_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!------------ Futures
  //-- Bloc
  sl.registerFactory<HomeCubit>(() => HomeCubit(getCitiesUsecase: sl()));
  sl.registerFactory<CityTextCubit>(() => CityTextCubit());
  sl.registerFactory<CitySearchCubit>(() => CitySearchCubit());
  sl.registerFactory<AvailableTripsCubit>(
      () => AvailableTripsCubit(getAvailableTripsUsecas: sl()));
  sl.registerFactory<AvailableSeatsCubit>(
      () => AvailableSeatsCubit(getAvailableSeatsUsecase: sl()));
  sl.registerFactory<PaymentMethodCubit>(() =>
      PaymentMethodCubit(getFirstTokenUsecase: sl(), getOrderIdUsecase: sl()));
  sl.registerFactory<CardPaymentCubit>(
      () => CardPaymentCubit(getPaymentKeyCardUsecase: sl()));
  sl.registerFactory<WalletPaymentCubit>(() => WalletPaymentCubit(
      getPaymentKeyWalletUsecase: sl(), getWalletUrlUsecase: sl()));

  //-- Use Cases
  sl.registerLazySingleton<GetCitiesUsecase>(() => GetCitiesUsecase(sl()));
  sl.registerLazySingleton<GetAvailableTripsUsecas>(
      () => GetAvailableTripsUsecas(availableTripsRepository: sl()));
  sl.registerLazySingleton<GetAvailableSeatsUsecase>(
      () => GetAvailableSeatsUsecase(availableSeatsRepository: sl()));
  sl.registerLazySingleton<GetFirstTokenUsecase>(
      () => GetFirstTokenUsecase(paymentRepository: sl()));
  sl.registerLazySingleton<GetOrderIdUsecase>(
      () => GetOrderIdUsecase(paymentRepository: sl()));
  sl.registerLazySingleton<GetPaymentKeyCardUsecase>(
      () => GetPaymentKeyCardUsecase(paymentRepository: sl()));
  sl.registerLazySingleton<GetPaymentKeyWalletUsecase>(
      () => GetPaymentKeyWalletUsecase(paymentRepository: sl()));
  sl.registerLazySingleton<GetWalletUrlUsecase>(
      () => GetWalletUrlUsecase(paymentRepository: sl()));

  //-- Repositories
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(networkInfo: sl(), homeRemoteDataSource: sl()));
  sl.registerLazySingleton<AvailableTripsRepository>(() =>
      AvailableTripsRepositoryImpl(
          networkInfo: sl(), availableTripsRemoteDataSource: sl()));
  sl.registerLazySingleton<AvailableSeatsRepository>(() =>
      AvailableSeatsRepositoryImpl(
          availableSeatsRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<PaymentRepository>(() => PaymentRepositoryImpl(
      getFirstTokenRemoteDataSource: sl(),
      getOrderIdRemoteDataSource: sl(),
      getPaymentKeyCardRemoteDataSource: sl(),
      getPaymentKeyWalletRemoteDataSource: sl(),
      getWalletUrlRemoteDataSource: sl(),
      networkInfo: sl()));

  //-- Data Sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceDIO());
  sl.registerLazySingleton<AvailableTripsRemoteDataSource>(
      () => AvailableTripsRemoteDataSourceDIO());
  sl.registerLazySingleton<AvailableSeatsRemoteDataSource>(
      () => AvailableSeatsRemoteDataSourceDIO());
  sl.registerLazySingleton<GetFirstTokenRemoteDataSource>(
      () => GetFirstTokenRemoteDataSourceDIO());
  sl.registerLazySingleton<GetOrderIdRemoteDataSource>(
      () => GetOrderIdRemoteDataSourceDIO());
  sl.registerLazySingleton<GetPaymentKeyCardRemoteDataSource>(
      () => GetPaymentKeyCardRemoteDataSourceDIO());
  sl.registerLazySingleton<GetPaymentKeyWalletRemoteDataSource>(
      () => GetPaymentKeyWalletRemoteDataSourceDIO());
  sl.registerLazySingleton<GetWalletUrlRemoteDataSource>(
      () => GetWalletUrlRemoteDataSourceDIO());

  //--Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  //--External
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
