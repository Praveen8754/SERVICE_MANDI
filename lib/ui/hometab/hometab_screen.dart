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
            length: 1,
            child: Scaffold(
                backgroundColor: AppColors().orange,
                appBar: AppBar(
                  leading: Image(
                      image: AssetImage(context.resources.drawable.logobig)),
                  title: Text("Welcome jrk"),
                  actions: [
                    IconButton(
                      onPressed: () {
                        print("support");
                        //    bloc?.add(Supportclicked());
                      },
                      icon: Icon(
                        Icons.support_agent,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print("notifications");
                        //   bloc?.add(Notificationclicked());
                      },
                      icon: Icon(
                        Icons.notifications,
                      ),
                    ),
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
                        Tab(
                            text:
                                context.resources.strings!.homeTab.toString()),
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
                )),
          ));
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
                ButtonWidget(index: 1,name:context.resources.strings!.servicesandrepairs, imagee: Image(image: AssetImage(context.resources.drawable.servicesrepairss)),),
                SizedBox(width: MediaQuery.of(context).size.width/10,),
                ButtonWidget(index: 2, name: context.resources.strings!.serviceBooking, imagee: Image(image: AssetImage(context.resources.drawable.servicebooking)),),
                SizedBox(width: MediaQuery.of(context).size.width/10,),
                ButtonWidget(index: 3, name: context.resources.strings!.wheelAlignment, imagee: Image(image: AssetImage(context.resources.drawable.wheelalignment)),),

                /* InkWell(
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
                    child: MaterialButton(
                      onPressed: () {},
                      child:Image(

                          image: AssetImage(context.resources.drawable.servicesndrepairs))
                    ),
                  ),
                ),
              ),*/

            /*    DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    border: Border(
                        right: BorderSide(color: Colors.orange),
                        bottom: BorderSide(color: Colors.orange)),
                  ),
                  child: MaterialButton(
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
                        bottom: BorderSide(color: Colors.orange)),
                  ),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text('TextButton1'),
                  ),
                ),*/
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final int index;
  String name;
  Image imagee;

   ButtonWidget({Key? key, required this.index,required this.name,required this.imagee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HometabBloc buttonBloc = BlocProvider.of<HometabBloc>(context);

    return BlocConsumer<HometabBloc, HometabState>(
      listener: (context, state) {
        if (state.isPressed) {
          if (state.buttonIndex == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FirstPage()),
            );
          }
          if (state.buttonIndex == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          }
        }
      },
      builder: (context, state) {
        return InkWell(
            onTap: () {
              buttonBloc.add(ButtonPressed(index));
            },
            splashColor: Colors.orange,
            child: Column(
              children: [


                Image(
                    //height: 100,
                  //  width: 100,
                    image: AssetImage(imagee)),










                Text('Button $index'),
              ],
            ));
        /* ElevatedButton(
          onPressed: () {
            buttonBloc.add(ButtonPressed(index));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              state.isPressed ? Colors.blue : Colors.green,
            ),
          ),
          child: Text('Button $index'),
        );*/
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Text("First"),
      ),
    );
  }
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Text("First"),
      ),
    );
  }
}
