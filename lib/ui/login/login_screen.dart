import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/res/colors/app_colors.dart';
import 'package:gro_stellar_renewed/res/styles/app_styles.dart';
import 'package:gro_stellar_renewed/utils/internet_check.dart';
import 'package:gro_stellar_renewed/widgets/custom_toast.dart';
import '../../routes/routes.dart';
import '../../widgets/app_widgets.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginScreen extends StatelessWidget {
  LoginBloc? bloc;
  LoginBloc? bloc1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState && state.loginResponse!.status == 200) {
          navigate(context, Routes.homeScreen);
        } else if (state is LoginSuccessState &&
            state.loginResponse!.status != 200) {
          CustomToast.instance.showMsg(context,
              context.resources.strings!.invalidUser, AppColors().black);
        }
        if (state is LoadingState) {}
        if (state is LoginFailedState) {}
      },
      builder: (context, state) {
        bloc = BlocProvider.of<LoginBloc>(context);
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: AppColors().secondaryColor,
          body: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      // Adjust the radius as needed
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.85,
                        color: AppColors().statsCardSeparatorColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            

                         //   Text(h)
                            
                            
                            
                            
                            
                            
                            
                            Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(
                                    context.resources.drawable.logoSmall)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppWidgets.getTextField(
                                  context,
                                  usernameController,
                                  context.resources.strings!.usernameLabel,
                                  true,
                                  const Icon(Icons.people),
                                  () {}),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppWidgets.getTextField(
                                  context,
                                  passwordController,
                                  context.resources.strings!.passwordLabel,
                                  true,
                                  const Icon(Icons.lock),
                                  () {}),
                            ),
                            TextButton(
                              style: AppStyle().flatButtonStyle,
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                Internet.checkInternet().then((value) {
                                  if (value) {
                                    if (usernameController.text.isNotEmpty &&
                                        passwordController.text.isNotEmpty) {
                                      bloc!.add(ValidateLoginEvent(
                                        username: usernameController.text,
                                        password: passwordController.text,
                                      ));
                                    } else {
                                      CustomToast.instance.showMsg(
                                          context,
                                          "Fields cannot be empty",
                                          AppColors().black);
                                    }
                                  } else {
                                    CustomToast.instance.showMsg(
                                        context,
                                        "Please check internet",
                                        AppColors().black);
                                  }
                                });
                              },
                              child: const Text('Login'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              (state is LoadingState)
                  ? Center(child: AppWidgets.getCenterLoadingView(context))
                  : const SizedBox()
            ],
          ),
          /*bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  bloc!.add(ValidateLoginEvent(
                    password: '1234',
                    username: 'GDP00075',
                  ));
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors().appBarColor,
                  child: Center(
                      child: Text(
                    "LOGIN / REGISTER",
                    style: AppStyle().bigHeadingTextStyle,
                  )),
                ),
              ),
            ),*/
        );
      },
    );
  }

  navigate(BuildContext context, String targetScreenID) async {
    var duration = const Duration(seconds: 0);
    return Timer(
      duration,
      () {
        Navigator.of(context, rootNavigator: true)
            .pushReplacementNamed(targetScreenID, arguments: "");
      },
    );
  }

  navigateOnly(BuildContext context, String targetScreenID) async {
    var duration = const Duration(seconds: 0);
    return Timer(
      duration,
      () {
        Navigator.of(context, rootNavigator: true)
            .pushNamed(targetScreenID, arguments: "");
      },
    );
  }
}
