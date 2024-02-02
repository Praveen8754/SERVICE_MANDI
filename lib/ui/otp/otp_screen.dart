import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/res/colors/app_colors.dart';
import 'package:gro_stellar_renewed/res/styles/app_styles.dart';
import 'package:gro_stellar_renewed/ui/otp/bloc/otp_bloc.dart';
import 'package:gro_stellar_renewed/widgets/app_widgets.dart';

class OtpScreen extends StatelessWidget {
  OtpBloc? bloc;
  bool isLoading = false;
  TextEditingController phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OtpBloc>(
      create: (context) => OtpBloc(),
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return BlocConsumer<OtpBloc, OtpState>(
      listener: (context, state) {},
      builder: (context, state) {
        bloc = BlocProvider.of<OtpBloc>(context);
        return Scaffold(
            backgroundColor: AppColors().orange,
            appBar: AppBar(
              backgroundColor: AppColors().orange,
            ),
            body: Container(
                child: Padding(
                    padding: EdgeInsets.all(MediaQuery
                        .of(context)
                        .size
                        .width / 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(context.resources.strings!.hiThereText, style:AppStyle().hithere/*TextStyle(color: AppColors().white,  ),*/),
                          Text(context.resources.strings!.letsgetstartedText, style: TextStyle(color: AppColors().white)),
                          Center(
                            child: Image(

                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 4,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 4,
                                image:
                                AssetImage(context.resources.drawable.logobig)),
                          ),
                          AppWidgets.getTextFieldWithonChanged(
                              context,
                              phonenumber,
                              context.resources.strings!.enterthemobilenumber,
                              bloc!

                            /*    onChanged: (text) {
                            setState(() {


                              // Check your conditions here
                              if (text.length >= 5) {
                                _isButtonEnabled = true;
                              } else {
                                _isButtonEnabled = false;
                              }*/
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/10,),

                          AppWidgets.buttonWithStateManage(context, state),



                         /* ElevatedButton(
                            onPressed: (state is MobileNumberValid) ? () {
                              // Handle button press here
                              print('Button pressed');
                            } : null,
                            child: Text(context.resources.strings!.requestotp),
                          ),*/
                        ]
                    )
                )

            )
        );
      }
    );

  }


}
