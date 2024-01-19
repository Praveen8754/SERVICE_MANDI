
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gro_stellar_renewed/main.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/ui/home/bloc/home_bloc.dart';
import 'package:gro_stellar_renewed/ui/home/bloc/home_state.dart';
import 'package:gro_stellar_renewed/utils/url_launcher.dart';
import '../../routes/routes.dart';
import '../../utils/enum.dart';
import '../../widgets/app_widgets.dart';
import '../../widgets/navigation_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeBloc? bloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    var loadingView = AppWidgets.getOverlayLoadingView(context);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        bloc = BlocProvider.of<HomeBloc>(context);
        return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(context.resources.strings!.appName),
              leading: IconButton(icon: Icon(Icons.menu), onPressed: () {  _scaffoldKey.currentState!.openDrawer();},),
            ),
            drawer: LumeOXNavigationDrawer(
              countryMenuClick: (events) {
                Navigator.pop(context);
                switch (events) {
                  case NavigationAction.englishLang:
                    MyApp.setLocale(context, const Locale("en"));
                    break;
                  case NavigationAction.hindiLang:
                    MyApp.setLocale(context, const Locale("hi"));
                  case NavigationAction.medium:
                    UrlLauncher.launchURL("https://x.medium.com/");
                    break;
                  case NavigationAction.linkedIn:
                    UrlLauncher.launchURL("https://in.linkedin.com/in/x-card");
                    break;
                  case NavigationAction.github:
                    UrlLauncher.launchURL("https://github.com/x");
                    break;
                  default:
                }
              },
            ),
            body: Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                    },
                    child:const Text(
                      "Home",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                if(isLoading)loadingView[0],
                if(isLoading)loadingView[1],
              ],
            )

        );
      },
    );
  }
  navigate(BuildContext context, String targetScreenID) async {
    var duration = const Duration(seconds: 0);
    return Timer(duration,() {
      Navigator.of(context, rootNavigator: true).pushReplacementNamed(targetScreenID, arguments: "");
    },);
  }
}

