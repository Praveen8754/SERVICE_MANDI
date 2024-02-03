import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/res/colors/app_colors.dart';
import 'package:gro_stellar_renewed/res/styles/app_styles.dart';
import 'package:gro_stellar_renewed/ui/otpfetch/bloc/otpfetch_bloc.dart';
import 'package:gro_stellar_renewed/widgets/app_widgets.dart';

class OtpfetchScreen extends StatelessWidget {
  String? username="kr";
  int? mobilenumber=9876543211;
  int? otp=65;
  var controller = TextEditingController();


  OtpfetchScreen(/*this. username, this. mobilenumber,this. otp,*/ {super.key});

  OtpfetchBloc? bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpfetchBloc>(
      create: (context) => OtpfetchBloc(),
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return BlocConsumer<OtpfetchBloc, OtpfetchState>(
        listener: (context, state) {},
        builder: (context, state) {
          bloc = BlocProvider.of<OtpfetchBloc>(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors().orange,
            ),
            body: Container(
              color: AppColors().orange,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      context.resources.strings!.welcometoservicemandi,
                      style: AppStyle().bigHeadingTextStyle,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Image(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 4,
                        image: AssetImage(context.resources.drawable.logobig)),

                   Padding(
                     padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 10, 0, MediaQuery.of(context).size.width / 10, 0),
                     child: Container(
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height / 20,
                       color: AppColors().grey,
                       child: Padding(
                         padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/30,0,0,0),
                         child: Row(
                           children: [
                             Icon(
                               Icons.person,
                               color: Colors.black,
                             ),
                             SizedBox(
                               width: MediaQuery.of(context).size.width/13,
                             ),
                             Text(username!)
                           ],
                         ),
                       ),

                     ),

                   ),
                    SizedBox(height: MediaQuery.of(context).size.height/30),
                    Padding(
                      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 10, 0, MediaQuery.of(context).size.width / 10, 0),
                      child:  Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 20,
                        color: AppColors().grey,
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/30,0,0,0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width/13,
                              ),
                              Text(mobilenumber.toString())
                            ],
                          ),
                        ),

                      ), ),
                    SizedBox(height: MediaQuery.of(context).size.height/30),
                   Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10, 0, MediaQuery.of(context).size.width/10, 0) ,
                       child:AppWidgets.getTextFieldOTPCheckWithonChanged(context,otp!,"Enter OTP",bloc!)),

                    SizedBox(height: MediaQuery.of(context).size.height/30),
                    Padding(padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/1.8, 0, MediaQuery.of(context).size.width/600, 0) ,
                      child: TextButton(onPressed: () {  }, child: Text("Resend OTP",style: AppStyle().whiteTextStyle,),),
                   ),
                    Container(width:MediaQuery.of(context).size.width/1.2 ,
                      child:  state is OtpValid ?  AppWidgets.buttonWithStateManage(context, state, ): AppWidgets.DisabledbuttonwithStateManage(context, state),
                    )

                  //  state is OtpValid ?  AppWidgets.buttonWithStateManage(context, state, ): AppWidgets.DisabledbuttonwithStateManage(context, state)
]
                    ),
            )
          )






                );
        });
  }
}
