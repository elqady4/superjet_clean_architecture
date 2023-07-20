import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/cubites/available_seats/available_seats_cubit.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubites/card_payment_cubit/cubit/card_payment_cubit.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/cubites/payment_method_cubit/payment_method_cubit.dart';
import 'package:suberjet_clean_architecture/features/splash/presentation/cubit/locale_cubit.dart';
import 'features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'features/available_trips/presentation/cubites/available_trips/available_trips_cubit.dart';
import 'features/home/presentation/cubits/citu_search_cubit/city_search_cubit.dart';
import 'features/home/presentation/cubits/city_text_cubit/city_text_cubit.dart';
import 'features/payment/presentation/cubites/wallet_payment_cubit/cubit/wallet_payment_cubit.dart';
import 'super_jet_app.dart';
import 'bloc_observer.dart';
import 'features/home/presentation/cubits/retrive_cities_cubit/home_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  Bloc.observer = AppBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => di.sl<HomeCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<CityTextCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<CitySearchCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<AvailableTripsCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<AvailableSeatsCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<PaymentMethodCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<CardPaymentCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<WalletPaymentCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<UserCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<AuthCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<UserDataCubit>(),
      ),
      BlocProvider(
        create: (context) => di.sl<LocaleCubit>(),
      ),
      /*
      BlocProvider(
        create: (context) => StopLocationsCubit(TripStopLocationsService()),
      ),*/
    ],
    child: const SuperJetApp(),
  ));
}
