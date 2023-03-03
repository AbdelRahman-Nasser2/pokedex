import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pokedex/modules/allpokemons.dart';
import 'package:pokedex/modules/favourites.dart';
import 'package:pokedex/shared/cubit/cubit.dart';
import 'package:pokedex/shared/cubit/states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getHomeData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                title: SvgPicture.asset('assets/logo1.svg'),
                elevation: 1,
              ),
              body: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: 48,
                    child: TabBar(
                        indicatorColor: HexColor('#3558CD'),
                        labelColor: Colors.black,
                        unselectedLabelStyle: TextStyle(
                          fontSize: 16,
                          color: HexColor('#6B6B6B'),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: HexColor('#3558CD'),
                        ),
                        indicatorWeight: 4,
                        // labelPadding: EdgeInsets.symmetric(horizontal: 5),
                        automaticIndicatorColorAdjustment: false,
                        unselectedLabelColor: HexColor('#6B6B6B'),
                        splashBorderRadius: BorderRadius.circular(28),
                        tabs: [
                          const Tab(
                            child: Text(
                              "All Pokemons",
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 25),
                            child: Tab(
                              child: Row(
                                children: [
                                  const Text(
                                    "Favourites",
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: HexColor('#3558CD'),
                                    child: const Text('2'),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                  const Expanded(
                    child: TabBarView(
                        dragStartBehavior: DragStartBehavior.down,
                        children: [
                          AllPokemonsScreen(),
                          FavouritesScreen(),
                        ]),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
