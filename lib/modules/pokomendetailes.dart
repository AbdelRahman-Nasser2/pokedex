import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pokedex/shared/cubit/cubit.dart';
import 'package:pokedex/shared/cubit/states.dart';

class PokomenDetails extends StatelessWidget {
  final String url;
  final String id;
  const PokomenDetails(this.url, this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getPokemonData(url),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return ConditionalBuilder(
            condition: (state is! PokemonGetDataLoading) ? true : false,
            builder: (BuildContext context) {
              return SafeArea(
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  floatingActionButton: Container(
                    height: 50,
                    width: 157,
                    decoration: BoxDecoration(
                      color: HexColor('#3558CD'),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(36),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 0)
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Make as favourite",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 288,
                        child: Stack(
                          children: [
                            Container(
                              height: 288,
                              width: double.infinity,
                              // clipBehavior: Clip.antiAlias,
                              color: Colors.redAccent,
                              child: SvgPicture.network(
                                cubit.pokemonModel!.sprites!.other!.dreamWorld!
                                    .frontDefault!,
                                // 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/17.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 16, top: 60, bottom: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cubit.pokemonModel!.name!,
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w700,
                                      color: HexColor('#161A33'),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Grass,Poison',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor('#161A33'),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '#$id',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: HexColor('#161A33'),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        height: 78,
                        padding: const EdgeInsetsDirectional.only(start: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Height',
                                  style: TextStyle(
                                      color: HexColor('#6B6B6B'),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  cubit.pokemonModel!.height!.toString(),
                                  style: TextStyle(
                                      color: HexColor('#161A33'),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 48,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Weight',
                                  style: TextStyle(
                                      color: HexColor('#6B6B6B'),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  cubit.pokemonModel!.weight!.toString(),
                                  style: TextStyle(
                                      color: HexColor('#161A33'),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 48,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'BMI',
                                  style: TextStyle(
                                      color: HexColor('#6B6B6B'),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '14.7',
                                  style: TextStyle(
                                      color: HexColor('#161A33'),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 16),
                        child: Text(
                          'Base Stats',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: HexColor('#161A33'),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: HexColor('#E8E8E8'),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 8, end: 8, bottom: 25),
                          child: ListView.separated(
                            padding:
                                const EdgeInsetsDirectional.only(bottom: 16),
                            itemCount: cubit.pokemonModel!.stats!.length,
                            itemBuilder: (context, index) => Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      cubit.pokemonModel!.stats![index].stat!
                                          .name!,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: HexColor('#6B6B6B'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      cubit.pokemonModel!.stats![index].baseStat
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: HexColor('#161A33')),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 4,
                                  child: Slider(
                                    value: cubit
                                        .pokemonModel!.stats![index].baseStat!
                                        .ceilToDouble(),
                                    max: 100,
                                    min: 0,
                                    activeColor: (cubit.pokemonModel!
                                                .stats![index].baseStat! >=
                                            40)
                                        ? HexColor('#EEC218')
                                        : HexColor('#CD2873'),
                                    inactiveColor: HexColor('#E8E8E8'),
                                    onChanged: (double value) {},
                                  ),
                                ),
                              ],
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            fallback: (BuildContext context) {
              return Center(
                child: CircularProgressIndicator(
                  color: HexColor('#3558CD'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
