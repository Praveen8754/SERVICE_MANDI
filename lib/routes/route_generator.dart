import 'package:flutter/material.dart';
import 'package:gro_stellar_renewed/routes/routes.dart';
import 'package:gro_stellar_renewed/ui/home/home_screen.dart';
import 'package:gro_stellar_renewed/ui/hometab/hometab_screen.dart';
import 'package:gro_stellar_renewed/ui/otp/otp_screen.dart';
import 'package:gro_stellar_renewed/ui/otpfetch/otpfetch_screen.dart';
import 'package:gro_stellar_renewed/ui/preferred_language/preferred_language_screen.dart';
import '../ui/Login/login_screen.dart';
import '../ui/Splash/splash_screen.dart';
import '../ui/carosual/carosual_screen.dart';
import '../ui/carosual/carosual_screen.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.carosuelScreen:
        return MaterialPageRoute(
          builder: (context) {
            return CarosualScreen();
          },
        );

      case Routes.preferredlanguageScreen:
        return MaterialPageRoute(
          builder: (context) {
            return Preferred_languagescreen();
          },
        );


      case Routes.otpfetchScreen:
        return MaterialPageRoute(
          builder: (context) {
            return OtpfetchScreen();
          },
        );



      case Routes.hometabScreen:
        return MaterialPageRoute(
          builder: (context) {
            return HometabScreen();
          },
        );






      case Routes.otpScreen:
        return MaterialPageRoute(
          builder: (context) {
            return OtpScreen();
          },
        );



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
