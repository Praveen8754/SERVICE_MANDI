import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/ui/hometab/bloc/hometab_bloc.dart';
import 'package:gro_stellar_renewed/widgets/app_widgets.dart';

import '../../res/colors/app_colors.dart';

class HometabScreen extends StatelessWidget {
  HometabBloc? bloc;
/*  var buttonn = [

  {
  "img":
  ,"name":"Service & Repairs

  "

  ,
},
{
"img":
"name":
},
{
"img":
"name":
},
{
"img":
"name":
},
{
"img":
"name":
},
{
"img":
"name":
},
{
"img":
"name":
},
{
"img":
"name":
},
{
"img":
"name":
},


]*/



@override
Widget build(BuildContext context) {
  return BlocProvider<HometabBloc>(
    create: (context) => HometabBloc(),
    child: _buildBody(context),
  );
}

_buildBody(BuildContext context) {
 return BlocConsumer<HometabBloc, HometabState>(
      listener: (context, state) {},
      builder: (context, state) {
        bloc = BlocProvider.of<HometabBloc>(context);
        return MaterialApp(
home: DefaultTabController(
length:1,
          child: Scaffold(
              backgroundColor: AppColors().orange,
              appBar: AppBar(

                leading:
                Image(image: AssetImage(context.resources.drawable.logobig)),
                title: Text("Welcome jrk"),

                actions: [




                  IconButton(onPressed: () {
                    print("support");
                    bloc?.add(Supportclicked());
                  }, icon: Icon(
                    Icons.support_agent,
                  ),),
                  IconButton(onPressed: () {
                    print("notifications");
                    bloc?.add(Notificationclicked());
                  }, icon: Icon(
                    Icons.notifications,
                  ),),
                  /* IconButton(
                    icon: Icon(Icons.menu), // Example icon for opening the drawer
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer(); // Open the end drawer
                    },
                  ),*/
          /*Drawer(
          child: Drawer,
          )
            */
                ],

                bottom: TabBar(
                  //controller: _tabController,
                    tabs: [
                      Tab(text: context.resources.strings!.homeTab.toString()),
                  /*    Tab(text: context.resources.strings!.ordersTab.toString()),
                      Tab(text: context.resources.strings!.profileTab.toString()),*/


                      /*    Tab(text: "Tab 2") */
                    ]),

              ),
              body: TabBarView(
                children: [

                  Tab(
                    child: Home(context),
                  ),


              /*    Tab(
                    child: Orders(),
                  ),
                  Tab(
                    child: Profile(),
                  )
          */

                ],
              )

          ),
        )
        );
      });
}

Widget Home(BuildContext context) {
  print("home");
  return Scaffold(
    body: Container(
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width/4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                
                      border: Border(
                        right: BorderSide(color: Colors.orange),
                        bottom: BorderSide(color: Colors.orange)
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text('TextButton'),
                    ),
                  ),
                ),
              ),

              DecoratedBox(

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),

                  border: Border(
                      right: BorderSide(color: Colors.orange),
                      bottom: BorderSide(color: Colors.orange)
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text('TextButton'),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),

                  border: Border(
                      right: BorderSide(color: Colors.orange),
                      bottom: BorderSide(color: Colors.orange)
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text('TextButton'),
                ),
              ),

            ],
          )
        ],
      ),
    ),
  );
}}
