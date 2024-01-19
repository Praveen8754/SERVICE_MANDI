import 'package:flutter/material.dart';
import '../../res/colors/app_colors.dart';
import '../../res/dimensions/app_dimensions.dart';

class AppStyle {

  TextStyle splashHeadingLogo = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().smallText_14,
      fontWeight: FontWeight.normal,
      color: AppColors().colorPrimaryText);

  TextStyle loginHeadingTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.bold,
      color: AppColors().colorPrimaryText);

  TextStyle bottomTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().smallText_14,
      fontWeight: FontWeight.w600,
      color: AppColors().colorPrimaryText);

  TextStyle linkTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().smallText_14,
      fontWeight: FontWeight.w600,
      color: AppColors().colorLink);

  TextStyle bigHeadingTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().bigText,
      fontWeight: FontWeight.bold,
      color: AppColors().colorBG);

  TextStyle headingTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.normal,
      color: AppColors().colorPrimaryText);

  TextStyle headingTextBoldStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.bold,
      color: AppColors().colorPrimaryText);

  TextStyle subHeadingTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorPrimaryText);

  // TextStyle appbarTitleStyle =
  // TextStyle(fontFamily: 'Poppins', fontSize: AppDimension().defaultText, fontWeight: FontWeight.w600, color: AppColors().colorAppbarTitle);

  TextStyle normalTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().verySmallText,
      fontWeight: FontWeight.w600,
      color: Colors.black);

  TextStyle whiteTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().defaultText,
      fontWeight: FontWeight.w600,
      color: Colors.white);

  TextStyle whiteTextSmallStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().smallText_14,
      fontWeight: FontWeight.w600,
      color: Colors.white);

  TextStyle appBarTitleStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorAppbarTitle);

  TextStyle drawerHeadingStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorAppbarTitle);

  TextStyle drawerTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: AppColors().colorSecondaryText);

  TextStyle drawerSubTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w400,
      color: AppColors().colorPrimary.shade900);

  TextStyle messagePanelButtonSupportTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().verySmallText,
      fontWeight: FontWeight.w600,
      color: Colors.black54);

  TextStyle tripsCardTitleStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().mediumText,
      fontWeight: FontWeight.w600,
      color: Colors.black);

  TextStyle tripsCardSubTitleStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: AppDimension().smallText_14,
      fontWeight: FontWeight.w600,
      color: Colors.black54);

  IconThemeData appbarIconTheme =
      IconThemeData(color: AppColors().colorAppbarTitle);

  ButtonStyle buttonStyle = TextButton.styleFrom(
      textStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppDimension().mediumText,
          fontWeight: FontWeight.w600,
          color: AppColors().colorAccent),
      foregroundColor: Colors.blueAccent);

  ButtonStyle backButtonWhiteStyle = TextButton.styleFrom(
      textStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: AppDimension().mediumText,
          fontWeight: FontWeight.w600,
          color: AppColors().black),
      foregroundColor: Colors.white);

  OutlineInputBorder myInputBorder(){ //return type is OutlineInputBorder
    return const OutlineInputBorder( //
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        )
    );
  }

  OutlineInputBorder myFocusBorder(){
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        )
    );
  }

  ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: AppColors().white,
    backgroundColor: AppColors().appBarColor,
    minimumSize: Size(88, 36),
    elevation: 15,
    shadowColor: Colors.black,
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

}
