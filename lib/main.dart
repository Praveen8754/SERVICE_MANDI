import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/res/app_localization_delegate.dart';
import 'package:gro_stellar_renewed/routes/route_generator.dart';
import 'package:gro_stellar_renewed/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    if (kDebugMode) {
      print("Language Selected : ${newLocale.countryCode} / ${newLocale.languageCode}");
    }
    var state = context.findAncestorStateOfType<MyAppState>();
    state?.setLocale(newLocale);
  }
}

class MyAppState extends State<MyApp> {

  late Locale _locale;

  @override
  void initState() {
    _portraitModeOnly();
    super.initState();
  }

  @override
  void dispose() {
    _enableRotation();
    super.dispose();
  }

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    setState(() {
      _locale = const Locale("en");
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: context.resources.color.colorPrimary,
      ),
      initialRoute: Routes.otpScreen,
      onGenerateRoute: RouteGenerator().generateRoute,
      locale: _locale,
      supportedLocales: const [
        Locale("en"),
        Locale("hi"),
      ],
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocal in supportedLocales) {
          if (supportedLocal.languageCode == locale?.languageCode &&
              supportedLocal.countryCode == locale?.countryCode) {
            return supportedLocal;
          }
        }
        return supportedLocales.first;
      },
    );
  }

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _enableRotation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}
