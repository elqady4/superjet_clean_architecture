import 'package:flutter/material.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/screens/take_seat_screen.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/screens/choose_payment_method_screen.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/screens/payment_card_webview_screen.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/screens/payment_wallet_webview_screen%20copy.dart';

import '../../core/utils/app_strings.dart';
import '../../features/available_trips/presentation/screens/trips_available_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String availableTripsRoute = '/availableTrips';
  static const String takeSeatRoute = '/availableSeats';
  static const String choosePaymentMethodRoute = '/choosePaymentMethod';
  static const String paymentCardWebviewRoute = '/paymentCardWebview';
  static const String paymentWalletWebviewRoute = '/paymentWalletWebview';
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
      case Routes.choosePaymentMethodRoute:
        return MaterialPageRoute(builder: ((context) {
          return const ChoosePaymentMethodScreen();
        }));
      case Routes.paymentCardWebviewRoute:
        return MaterialPageRoute(builder: ((context) {
          return const PaymentCardWebViewScreen();
        }));
      case Routes.paymentWalletWebviewRoute:
        return MaterialPageRoute(builder: ((context) {
          return const PaymentWalletWebViewScreen();
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
