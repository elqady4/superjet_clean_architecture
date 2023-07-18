import 'package:flutter/material.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/screens/login_screen.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/screens/register_screen.dart';
import 'package:suberjet_clean_architecture/features/available_trips/presentation/screens/take_seat_screen.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/screens/choose_payment_method_screen.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/screens/payment_card_webview_screen.dart';
import 'package:suberjet_clean_architecture/features/payment/presentation/screens/payment_wallet_webview_screen%20copy.dart';
import 'package:suberjet_clean_architecture/features/splash/presentation/screens/splash_screen.dart';
import 'package:suberjet_clean_architecture/super_jet_app.dart';

import '../../core/utils/app_strings.dart';
import '../../features/available_trips/presentation/screens/trips_available_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String superJetRoute = '/superjet';
  static const String homeRoute = '/home';
  static const String availableTripsRoute = '/availableTrips';
  static const String takeSeatRoute = '/availableSeats';
  static const String choosePaymentMethodRoute = '/choosePaymentMethod';
  static const String paymentCardWebviewRoute = '/paymentCardWebview';
  static const String paymentWalletWebviewRoute = '/paymentWalletWebview';
  static const String registerRoute = '/register';
  static const String loginRoute = '/login';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: ((context) {
          return const SplashScreen();
        }));
      case Routes.superJetRoute:
        return MaterialPageRoute(builder: ((context) {
          return const SuperJetApp();
        }));
      case Routes.homeRoute:
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
      case Routes.registerRoute:
        return MaterialPageRoute(builder: ((context) {
          return RegisterScreen();
        }));
      case Routes.loginRoute:
        return MaterialPageRoute(builder: ((context) {
          return LoginScreen();
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
