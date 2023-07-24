import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suberjet_clean_architecture/features/auth/data/datasources/firebase_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/auth/data/repositories/firebase_repository_impl.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/repositories/firebase_repository.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/get_create_current_user_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/get_current_user_id_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/is_sign_in_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:suberjet_clean_architecture/features/available_trips/data/datasources/available_seats_remote.dart';
import 'package:suberjet_clean_architecture/features/available_trips/data/repositories/available_seats_repository_impl.dart';
import 'package:suberjet_clean_architecture/features/available_trips/domain/usecases/get_available_seats_usecase.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/cubites/available_seats/available_seats_cubit.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/cubites/selected_seats_cubit/selected_seats_cubit.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_first_token_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_order_id_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_payment_key_card_remote_data_source.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_payment_key_wallet_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/get_wallet_url_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/datasources/reverse_seats_remote_datasource.dart';
import 'package:suberjet_clean_architecture/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/repositories/payment_repository.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_first_token_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_order_id_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_payment_key_card_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_payment_key_wallet_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/get_wallet_url_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/domain/usecases/reverse_seats_usecase.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubites/card_payment_cubit/cubit/card_payment_cubit.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubites/cubit/reverse_seats_cubit.dart';
import 'package:suberjet_clean_architecture/features/splash/data/datasources/lang_local_data_source.dart';
import 'package:suberjet_clean_architecture/features/splash/data/repositories/lang_repository_impl.dart';
import 'package:suberjet_clean_architecture/features/splash/domain/repositories/lang_repository.dart';
import 'package:suberjet_clean_architecture/features/splash/domain/usecases/change_lang.dart';
import 'package:suberjet_clean_architecture/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:suberjet_clean_architecture/features/splash/presentation/cubit/locale_cubit.dart';
import 'core/network/netwok_info.dart';
import 'features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/cubit/user_cubit/user_cubit.dart';
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
  sl.registerFactory<UserCubit>(() => UserCubit(
      getCreateCurrentUserUsecase: sl(),
      signInUsecase: sl(),
      signUpUsecase: sl()));
  sl.registerFactory<AuthCubit>(() => AuthCubit(
        getCurrentUserIdUsecase: sl(),
        isSignInUsecase: sl(),
        signOutUsecase: sl(),
      ));
  sl.registerFactory<UserDataCubit>(
      () => UserDataCubit(getCurrentUserUsecase: sl()));
  sl.registerFactory<LocaleCubit>(
      () => LocaleCubit(changeLangUseCase: sl(), getSavedLangUseCase: sl()));
  sl.registerFactory<SelectedSeatsCubit>(() => SelectedSeatsCubit());
  sl.registerFactory<ReverseSeatsCubit>(
      () => ReverseSeatsCubit(reverseSeatsUsecase: sl()));

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
  sl.registerLazySingleton<GetCreateCurrentUserUsecase>(
      () => GetCreateCurrentUserUsecase(firebaseRepository: sl()));
  sl.registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(firebaseRepository: sl()));
  sl.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecase(firebaseRepository: sl()));
  sl.registerLazySingleton<IsSignInUsecase>(
      () => IsSignInUsecase(firebaseRepository: sl()));
  sl.registerLazySingleton<SignOutUsecase>(
      () => SignOutUsecase(firebaseRepository: sl()));
  sl.registerLazySingleton<GetCurrentUserIdUsecase>(
      () => GetCurrentUserIdUsecase(firebaseRepository: sl()));
  sl.registerLazySingleton<GetCurrentUserUsecase>(
      () => GetCurrentUserUsecase(firebaseRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(
      () => ChangeLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ReverseSeatsUsecase>(
      () => ReverseSeatsUsecase(paymentRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(langRepository: sl()));

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
      reverseSeatsRemoteDataSource: sl(),
      networkInfo: sl()));
  sl.registerLazySingleton<FirebaseRepository>(() => FirebaseRepositoryImpl(
      firebaseRemoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataSource: sl()));

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
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl(auth: sl(), firestore: sl()));
  sl.registerLazySingleton<ReverseSeatsRemoteDataSource>(
      () => ReverseSeatsRemoteDataSourceDIO());
  sl.registerLazySingleton<LangLocalDataSource>(
      () => LangLocalDataSourceImpl(sharedPreferences: sl()));

  //--Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  //--External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
