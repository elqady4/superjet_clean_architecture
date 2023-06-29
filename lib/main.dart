import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/available_trips/presentation/cubit/available_trips_cubit.dart';
import 'features/home/presentation/cubits/citu_search_cubit/city_search_cubit.dart';
import 'features/home/presentation/cubits/city_text_cubit/city_text_cubit.dart';
/*
import 'package:superjet/api/availableSeatsService.dart';
import 'package:superjet/api/tripStopPointsService.dart';
import 'package:superjet/api/tripsService.dart';
import 'package:superjet/cubits/AvailableSeats_cubit/available_seats_cubit.dart';
import 'package:superjet/cubits/StopLocations_cubit/stop_locations_cubit.dart';
import 'package:superjet/cubits/Tripscubit/trips_cubit.dart';*/
import 'super_jet_app.dart';
import 'bloc_observer.dart';
import 'features/home/presentation/cubits/retrive_cities_cubit/home_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      /* BlocProvider(
        create: (context) => TripsCubit(TripsService()),
      ),
      BlocProvider(
        create: (context) => AvailableSeatsCubit(AvailableSeatsService()),
      ),
      BlocProvider(
        create: (context) => StopLocationsCubit(TripStopLocationsService()),
      ),*/
    ],
    child: const SuperJetApp(),
  ));
}
