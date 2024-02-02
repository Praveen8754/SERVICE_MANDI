import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/widgets/app_widgets.dart';

import '../../res/colors/app_colors.dart';
import 'bloc/preferred_language_screen_bloc.dart';

class Preferred_languagescreen extends StatelessWidget {
  Preferred_languagescreen({super.key});

  var lang = ["English", " हिंदी ", "English", "English", "English", "English"];
  PreferredLanguageScreenBloc? bloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PreferredLanguageScreenBloc>(
      create: (context) => PreferredLanguageScreenBloc(),
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return BlocConsumer<PreferredLanguageScreenBloc,
            PreferredLanguageScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          bloc = BlocProvider.of<PreferredLanguageScreenBloc>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.orange[400],
              appBar: AppBar(
                centerTitle: false,
                title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      context.resources.strings!.version,
                    )),
                /*actions: [
            Padding(
              padding:  EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/10, 0, 0, 0),
              child: Text(context.resources.strings!.version,),
            )
          ],*/
                /*titleSpacing: 0.0,
          title: Transform(transform:  Matrix4.translationValues(0, 0.0, -20.0),
          child: Text( context.resources.strings!.version,)),*/
                backgroundColor: Colors.orange[400],
              ),
              body: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image(
                            height: 100,
                            width: 100,
                            image: AssetImage(
                                context.resources.drawable.logoSmall)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(context.resources.strings!.hiThereText,
                                style: context.resources.style.headingTextStyle,
                                textAlign: TextAlign.left),
                            Text(
                              context.resources.strings!
                                  .letsgetstartedText, /*style: context.resources.style.headingTextStyle,*/
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                        context.resources.strings!.selectyourpreferredlanguage),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 100,
                    ),
                    ...lang.map((answer) {
                      return AppWidgets.langBarButton(
                        context,
                        answer.toString(),
                        //  onTap: answerQuestion,
                      );
                    })
                  ],
                ),
              ),
            ),
          );
        });
  }
}
