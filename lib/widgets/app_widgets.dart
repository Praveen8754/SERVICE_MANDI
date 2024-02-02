/*import 'dart:ffi';*/

import 'package:flutter/material.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/res/colors/app_colors.dart';

import '../res/styles/app_styles.dart';
import '../ui/otp/bloc/otp_bloc.dart';

class AppWidgets {
  static getAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: context.resources.color.appBarColor,
      iconTheme: context.resources.style.appbarIconTheme,
      centerTitle: true,
      title: Text(
        title,
        style: context.resources.style.appBarTitleStyle,
      ),
      actions: [],
    );
  }

  static langBarButton(
    BuildContext context,
    String answerText,
    /* Function() onTap*/
  ) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue, // Border color
              width: MediaQuery.of(context).size.width / 1200, // Border width
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          child: Column(
            children: [
              MaterialButton(
                onPressed: () {},
                child: Text(
                  answerText,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
      ],
    );
  }

  static buttonWithStateManage(
    BuildContext context,
    OtpState state,
      bool showoverlay
  ) {

      return Visibility(

        visible: showoverlay,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: AppColors().black,
            border: Border.all(
              color: AppColors().black, // Border color
              width: MediaQuery.of(context).size.width / 100, // Border width
            ),
            borderRadius: BorderRadius.circular(0),
          ),
          child: MaterialButton(
            onPressed:   (state is MobileNumberValid) ? () {
              // Handle button press here
              print('Button pressed');
            } : null,
            child: Text(
              context.resources.strings!.requestotp,
              style: TextStyle(color: AppColors().white),
            ),
          ),
        ),
      );
   /*{
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors().black,
          border: Border.all(
            color: AppColors().black, // Border color
            width: MediaQuery.of(context).size.width / 100, // Border width
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Center(
          child: Text(
            context.resources.strings!.requestotp,
            style: TextStyle(color: AppColors().white),
          ),
        ),
      );
    }*/
  }

  static getAppBarWithSingleIcon(
      BuildContext context, String title, Function() callback, Icon iconData) {
    return AppBar(
      backgroundColor: context.resources.color.appBarColor,
      iconTheme: context.resources.style.appbarIconTheme,
      centerTitle: true,
      title: Text(
        title,
        style: context.resources.style.appBarTitleStyle,
      ),
      actions: [
        Padding(
          padding:
              EdgeInsets.only(right: context.resources.dimension.defaultMargin),
          child: GestureDetector(
            onTap: callback,
            child: iconData,
          ),
        )
      ],
    );
  }

  static getTransparentAppBarWithIcons(
      BuildContext context, String title, Function() callback, Icon iconData) {
    return AppBar(
        //centerTitle: true,
        leading: BackButton(
          style: context.resources.style.backButtonWhiteStyle,
          color: context.resources.color.colorAccent,
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0);
  }

  static getDefaultSizedBox(BuildContext context) {
    return SizedBox(
      height: context.resources.dimension.defaultMargin,
    );
  }

  static getOverlayLoadingView(BuildContext context) {
    return [
      const Opacity(
        opacity: 0.8,
        child: ModalBarrier(dismissible: false, color: Colors.black),
      ),
      Center(
          child: CircularProgressIndicator(
        backgroundColor: context.resources.color.circularIndicatorBGColor,
        valueColor: AlwaysStoppedAnimation<Color>(
          context.resources.color.circularIndicatorMainColor, //<-- SEE HERE
        ),
      ))
    ];
  }

  static getTextField(BuildContext context, TextEditingController controller,
      String label, bool obscure, Icon icon, Function validate) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey,
      child: TextFormField(
          validator: validate(),
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.black),
            prefixIcon: icon,
            border: AppStyle().myInputBorder(),
            enabledBorder: AppStyle().myInputBorder(),
            focusedBorder: AppStyle().myFocusBorder(),
          )),
    );
  }

  static getTextFieldWithonChanged(BuildContext context,
      TextEditingController controller, String hint, OtpBloc bloc) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 20,
      color: AppColors().white,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 40),
        child: TextFormField(
          controller: controller,
          onChanged: (mobileNumber) {
            bloc.add(MobileNumberChanged(mobileNumber));
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            // prefix: const Icon(Icons.phone_android),
            filled: true,
            fillColor: AppColors().white,
            icon: const Icon(
              Icons.phone_android,
              color: Colors.black,
            ),

            hintText: hint,
          ),
          keyboardType: TextInputType.phone,
        ),
      ),
    );
  }

  static getCenterLoadingView(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: context.resources.color.circularIndicatorBGColor,
      valueColor: AlwaysStoppedAnimation<Color>(
        context.resources.color.circularIndicatorMainColor, //<-- SEE HERE
      ),
    );
  }

  static getBuildNoResult(BuildContext context, String errorMessage) {
    return Padding(
      padding: EdgeInsets.all(context.resources.dimension.defaultMargin),
      child: Center(
        child: Text(errorMessage),
      ),
    );
  }

  static animatedWidget(Widget widget, bool visible) {
    return AnimatedOpacity(
        // If the widget is visible, animate to 0.0 (invisible).
        // If the widget is hidden, animate to 1.0 (fully visible).
        opacity: visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 1000),
        child: widget);
  }
}
