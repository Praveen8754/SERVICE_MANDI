import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'bloc/carosual_bloc.dart';

class CarosualScreen extends StatelessWidget {
  CarosualScreenBloc? bloc;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CarosualScreenBloc>(
      create: (context) => CarosualScreenBloc(),
      child: _buildBody(context),
    );


  }

  Widget buildDotIndicator(int index, int currentIndex) {
    return Container(
      margin: EdgeInsets.all(4),
      width: currentIndex == index ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<CarosualScreenBloc, CarosualState>(
          listener: (context, state) {},
          builder: (context, state) {
            bloc = BlocProvider.of<CarosualScreenBloc>(context);
            int currentIndex = 0;

            if (state is CarouselIndexChanged) {
              currentIndex = state.currentIndex;
            }

            return Container(
              color: Color.fromRGBO(248, 124, 0, 100),
              child: CarouselSlider(
                items: [
                  // Your carousel items go here
                  Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.height / 24, 0,  MediaQuery.of(context).size.height / 22.5),
                      child: Image.asset(
                        'assets/images/wel1.png',
                        height: MediaQuery.sizeOf(context).height /1,
                         width: MediaQuery.sizeOf(context).width / 1.3,
                        scale: 0.2,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.of(context).size.height / 3.3, 0, 0),
                        child: Image.asset(
                          'assets/images/wel2.png',
                          height: MediaQuery.sizeOf(context).height / 2.3,
                          // width: MediaQuery.sizeOf(context).width / 2,
                          scale: 2.5,
                         ),
                        ),
                    ]),
                  ),
                  Center(
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.sizeOf(context).width / 7.5, MediaQuery.sizeOf(context).height / 6.5, MediaQuery.sizeOf(context).width / 12.5,0),
                        child: Image.asset(
                          'assets/images/wel3.png',
                          height: MediaQuery.sizeOf(context).height / 1.4,

                          scale: 0.9,
                      ),
                      )
                    ]),
                  ),
                  Center(
                    child: Column(children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, MediaQuery.sizeOf(context).height / 3.2, 0, 0),
                        child: Image.asset(
                          'assets/images/wel4.png',
                          height: MediaQuery.sizeOf(context).height / 2.5,
                          scale: 2.5,
                                              ),
                      )
                    ]),
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: false,
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 200),
                  height: MediaQuery.of(context).size.height,
                  onPageChanged: (index, reason) {
                    bloc!.add(PageChangedEvent(index));
                  },
                ),
              ),
            );
          },
        ),
        Positioned(
          left: MediaQuery.sizeOf(context).width / 2.2,
          bottom: MediaQuery.sizeOf(context).height / 10.2,
          child: BlocBuilder<CarosualScreenBloc, CarosualState>(
            builder: (context, state) {
              int currentIndex = 0;

              if (state is CarouselIndexChanged) {
                currentIndex = state.currentIndex;
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4, // Number of carousel items
                  (index) => buildDotIndicator(index, currentIndex),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height / 35,
          left: MediaQuery.sizeOf(context).width / 11,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width / 1.2, // <-- Your width
            height: MediaQuery.sizeOf(context).height / 15,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Login/Signup"),
            ),
          ),
        )
      ],
    );
    SizedBox(height: 20);
    BlocBuilder<CarosualScreenBloc, CarosualState>(
      builder: (context, state) {
        int currentIndex = 0;

        if (state is CarouselIndexChanged) {
          currentIndex = state.currentIndex;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3, // Number of carousel items
            (index) => buildDotIndicator(index, currentIndex),
          ),
        );
      },
    );


  }
}
