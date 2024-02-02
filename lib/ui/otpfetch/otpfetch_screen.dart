import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/res/colors/app_colors.dart';
import 'package:gro_stellar_renewed/res/styles/app_styles.dart';
import 'package:gro_stellar_renewed/ui/otpfetch/bloc/otpfetch_bloc.dart';

class OtpfetchScreen extends StatelessWidget {
  OtpfetchScreen({super.key});

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
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 10,
                        image: AssetImage(context.resources.drawable.logobig)),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
