import 'package:flutter/material.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/screens/take_seat_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../features/available_trips/presentation/screens/trips_available_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String availableTripsRoute = '/availableTrips';
  static const String takeSeatRoute = '/availableSeats';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) {
          return const HomeScreen();
        }));

      case Routes.availableTripsRoute:
        return MaterialPageRoute(builder: ((context) {
          return const AvailableTripsScreen();
        }));
      case Routes.takeSeatRoute:
        return MaterialPageRoute(builder: ((context) {
          return const TakeSeatScreen();
        }));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
