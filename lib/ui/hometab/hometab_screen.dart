import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/ui/hometab/bloc/hometab_bloc.dart';
import 'package:gro_stellar_renewed/widgets/app_widgets.dart';

import '../../res/colors/app_colors.dart';

class HometabScreen extends StatelessWidget {
  HometabBloc? bloc;

  HometabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HometabBloc>(
      create: (context) => HometabBloc(),
      child: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    BlocConsumer<HometabBloc, HometabState>(
        listener: (context, state) {},
        builder: (context, state) {
          bloc = BlocProvider.of<HometabBloc>(context);
          return Scaffold(
            backgroundColor: AppColors().orange,
            appBar: AppBar(

              leading:
                  Image(image: AssetImage(context.resources.drawable.logobig)),
              title: Text("Welcome jrk"),
              actions: [
                EndDrawerButton(

                )
                ,IconButton(onPressed: (){}, icon:  Icon(
                  Icons.support_agent,
                ),),
                IconButton(onPressed: (){}, icon:  Icon(
                  Icons.notifications,
                ),),
                IconButton(
                  icon: Icon(Icons.menu), // Example icon for opening the drawer
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer(); // Open the end drawer
                  },
                ),

              ],
              d
              

            ),
          );
        });
  }
}
