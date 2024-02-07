import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gro_stellar_renewed/res/app_context_extension.dart';
import 'package:gro_stellar_renewed/ui/hometab/bloc/hometab_bloc.dart';
import 'package:gro_stellar_renewed/widgets/app_widgets.dart';

import '../../res/colors/app_colors.dart';

class HometabScreen extends StatelessWidget {
  final List<String> allItems = [
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Pineapple',
    'Grapes',
    'Strawberry',
  ];
  HometabBloc? bloc;
  OrdertabBloc? bloc1;


  @override
  // ignore: must_call_super
  initState() {
    // ignore: avoid_print
    print("initState Called");
  }

  @override
  Widget build(BuildContext context) {



   return MultiBlocProvider(
        providers: [
    BlocProvider<HometabBloc>(
    create: (BuildContext context) => HometabBloc(),
    ),
    BlocProvider<OrdertabBloc>(
    create: (BuildContext context) => OrdertabBloc(allItems),
    ),
    ],
    child:  _buildBody(context));








/*    return BlocProvider<HometabBloc>(
      create: (context) => HometabBloc(),
      child: _buildBody(context),
    );*/
  }

  _buildBody(BuildContext context) {
    return BlocConsumer<HometabBloc, HometabState>(
        listener: (context, state) {},
        builder: (context, state) {
          bloc = BlocProvider.of<HometabBloc>(context);
          return MaterialApp(
              home: DefaultTabController(
            length: 2,
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
                           Tab(text: context.resources.strings!.ordersTab.toString()),
                        /*  Tab(text: context.resources.strings!.profileTab.toString()),*/

                        /*    Tab(text: "Tab 2") */
                      ]),
                ),
                resizeToAvoidBottomInset: false,
                body: TabBarView(
                  children: [
                    Tab(
                      child: Home(context),
                    ),
                    Tab(
                      child: Orders(context),
                    ),
                    /* Tab(
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
    List<ButtonWidget> choices = <ButtonWidget>[
      ButtonWidget(
          index: 1,
          name: context.resources.strings!.servicesandrepairs,
          imagee: Image(
              color: AppColors().orange,
              image: AssetImage(context.resources.drawable.servicesndrepairs)),
          h: MediaQuery.of(context).size.height / 10,
          w: MediaQuery.of(context).size.width / 3),
      ButtonWidget(
          index: 2,
          name: context.resources.strings!.serviceBooking,
          imagee: Image(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              image: AssetImage(context.resources.drawable.servicebooking)),
          h: MediaQuery.of(context).size.height / 10,
          w: MediaQuery.of(context).size.width / 3),
      ButtonWidget(
          index: 3,
          name: context.resources.strings!.wheelAlignment,
          imagee: Image(
              image: AssetImage(context.resources.drawable.wheelalignment)),
          h: MediaQuery.of(context).size.height / 10,
          w: MediaQuery.of(context).size.width / 1.7),
      ButtonWidget(
          index: 4,
          name: context.resources.strings!.powerSolutions,
          imagee: Image(
              image:
                  AssetImage(context.resources.drawable.powersolutionservice)),
          h: MediaQuery.of(context).size.height / 10,
          w: MediaQuery.of(context).size.width / 3),
      ButtonWidget(
          index: 5,
          name: context.resources.strings!.towingService,
          imagee: Image(
              image: AssetImage(context.resources.drawable.towingservice)),
          h: MediaQuery.of(context).size.height / 10,
          w: MediaQuery.of(context).size.width / 3),
      ButtonWidget(
          index: 6,
          name: context.resources.strings!.referforLoans,
          imagee: Image(
              image: AssetImage(context.resources.drawable.referforloans)),
          h: MediaQuery.of(context).size.height / 10,
          w: MediaQuery.of(context).size.width / 3),
      ButtonWidget(
          index: 7,
          name: context.resources.strings!.vehicleInsurance,
          imagee: Image(
              image: AssetImage(context.resources.drawable.vehicleinsurance)),
          h: MediaQuery.of(context).size.height / 10,
          w: MediaQuery.of(context).size.width / 3),
      ButtonWidget(
          index: 8,
          name: context.resources.strings!.myVehicles,
          imagee:
              Image(image: AssetImage(context.resources.drawable.myvehicles)),
          h: MediaQuery.of(context).size.height / 10,
          w: MediaQuery.of(context).size.width / 3),
      ButtonWidget(
          index: 9,
          name: context.resources.strings!.bunkLocator,
          imagee:
              Image(image: AssetImage(context.resources.drawable.bunklocator)),
          h: MediaQuery.of(context).size.height / 10,
          w: MediaQuery.of(context).size.width / 3),
    ];

    return Scaffold(
        body: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 18.0,
            children: List.generate(choices.length, (index) {
              return SelectCard(choice: choices[index]);
            }))

        /*
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height/10,),
            Row(
              children: [
                ButtonWidget(
                    index: 4,
                    name: context.resources.strings!.servicesandrepairs,
                    imagee: Image(
                        image: AssetImage(
                            context.resources.drawable.powersolutionservice)),
                    h:MediaQuery.of(context).size.height/8,
                    w:MediaQuery.of(context).size.width/3
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                ButtonWidget(
                    index: 5,
                    name: context.resources.strings!.serviceBooking,
                    imagee: Image(
                        image: AssetImage(
                            context.resources.drawable.towingservice)),
                    h:MediaQuery.of(context).size.height/8,
                    w:MediaQuery.of(context).size.width/3
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 30,
                ),
                ButtonWidget(
                    index: 6,
                    name: context.resources.strings!.wheelAlignment,
                    imagee: Image(
                        image: AssetImage(
                            context.resources.drawable.wheelalignment)),
                    h:MediaQuery.of(context).size.height/10,
                    w:MediaQuery.of(context).size.width/3
                ),
              ],
            )
          ],
        ),
      ),*/
        );
  }

  Widget Orders(BuildContext context) {








    final OrdertabBloc itemBloc = BlocProvider.of<OrdertabBloc>(context);
    List<String> items = [];
    final TextEditingController _searchController = TextEditingController();
    String searchTerm = '';
    Icon actionIcon = const Icon(Icons.search);
    return BlocConsumer<OrdertabBloc, OrdertabState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      body: Column(
        children: [
       /*   TextField(
            controller: _searchController,
            onChanged: (filterText) {
              itemBloc.add(FilterItems(filterText));
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: actionIcon,
              ),
              hintText: 'Search...',
            ),
          ),*/

          TextField(
            controller: _searchController,
            onChanged: (filterText) {
              itemBloc.add(FilterItems(filterText));
            },
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {
                      Navigator.pop(context);
                },
                icon: actionIcon,
              ),
              hintText: 'Search...',
            ),
          ),
          //ElevatedButton(onPressed: onPressed, child: child)

          Expanded(
            child: BlocBuilder<OrdertabBloc,  OrdertabState>(
              builder: (context, state) {
                if (state is FilteredItems) {
                  if(FilteredItems != null) {
                    return ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.items[index]),
                          // Handle onTap if needed
                        );
                      },
                    );
                  }
                  else{
                    return Center(
                      child: Text('No results'),
                    );
                  }
                }
                if(state is InitialState){
                  return ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.items[index]),
                        // Handle onTap if needed
                      );
                    },
                  );
                }
else{
                  return Text("data");
                }




              },
            ),
          ),
        ],
      ),
    );
  },
);
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard(
      {/*required Key key,*/ required this.choice}) /*: super(key: key)*/;

  final ButtonWidget choice;

  @override
  Widget build(BuildContext context) {
    //   final TextStyle textStyle = Theme.of(context).textTheme.display1;
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
            buttonBloc.add(ButtonPressed(choice.index));
          },
          splashColor: Colors.orange,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  //     height: choice.h,
                  //    width: choice.w,
                  child: Image(
                      height: choice.h,
                      width: choice.w,
                      //    width: w,
                      image: choice.imagee.image),
                ),
                Container(
                  child: Text(choice.name),
                )

                /*Image(
              height: choice.h,
              width: choice.w,
            //    width: w,
              image: choice.imagee.image),
            Text( choice.name*/ /*' $name'*/ /*),*/

                /*  InkWell(
                onTap: () {
                  buttonBloc.add(ButtonPressed(choice.index));
                },
                splashColor: Colors.orange,
                child: Column(
                  children: [
                    Container(
                      //  height: ,
                   //   width: w/3,
                      child: Image(
                        //  height: h,
                        //    width: w,
                          image: choice.imagee.image),
                    ),
                    Text( choice.name*/ /*' $name'*/ /*),
                  ],
                )),*/

                /*  Expanded(child: Image( */ /*color: Colors.orange,*/ /* image:  choice.imagee.image) ,),
            Text(choice.name, style: TextStyle(fontSize: 16)),*/
              ]),
        );
      },
    );
  }
}

class Choice {
  Choice({required this.title, required this.imagee, required this.index});

  final String title;
  Image imagee;
  int index;
// final IconData icon;
}

class ButtonWidget extends StatelessWidget {
  final int index;
  String name;
  Image imagee;
  double h, w;

  ButtonWidget(
      {Key? key,
      required this.index,
      required this.name,
      required this.imagee,
      required this.h,
      required this.w})
      : super(key: key);

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
        return SizedBox(
          width: w,
          height: h,
          child: InkWell(
              onTap: () {
                buttonBloc.add(ButtonPressed(index));
              },
              splashColor: Colors.orange,
              child: Column(
                children: [
                  Container(
                    //  height: ,
                    width: w / 3,
                    child: Image(
                        //  height: h,
                        //    width: w,
                        image: imagee.image),
                  ),
                  Text(' $name'),
                ],
              )),
        );
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
