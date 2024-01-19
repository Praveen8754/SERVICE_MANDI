import 'package:flutter/material.dart';
import 'package:gro_stellar_renewed/routes/routes.dart';
import 'package:gro_stellar_renewed/ui/home/home_screen.dart';
import '../ui/Login/login_screen.dart';
import '../ui/Splash/splash_screen.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return  LoginScreen();
          },
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
