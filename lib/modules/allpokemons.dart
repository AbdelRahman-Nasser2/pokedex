import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pokedex/models/allpokemonsmodel.dart';
import 'package:pokedex/modules/pokomendetailes.dart';
import 'package:pokedex/shared/components/components.dart';
import 'package:pokedex/shared/cubit/cubit.dart';
import 'package:pokedex/shared/cubit/states.dart';
import 'package:pokedex/shared/network/remote/http_Helper/http.dart';

class AllPokemonsScreen extends StatelessWidget {
  const AllPokemonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
        return ConditionalBuilder(
          condition: (state is! HomeGetDataLoading) ? true : false,
          builder: (BuildContext context) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: false,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              itemCount: cubit.allPokemonsModel!.results!.length,
              itemBuilder: (context, index) => pokemonShape(
                  cubit.allPokemonsModel!.results![index],
                  (index + 1).toString().padLeft(3, '0'),
                  context),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 11,
                  crossAxisSpacing: 13,
                  mainAxisExtent: 186),
            );
          },
          fallback: (BuildContext context) {
            return Center(
                child: CircularProgressIndicator(
              color: HexColor('#3558CD'),
            ));
          },
        );
      },
    );
  }

//1.svg
  Widget pokemonShape(Results results, String id, context) => InkWell(
        onTap: () {
          // AppCubit.get(context).getHomeData();
          HTTP.getData().then((value) {
            // navigateTo(context, PokomenDetails());
          });
          navigateTo(context, PokomenDetails(results.url!, id));
        },
        child: Container(
          height: 186,
          width: 110,
          color: HexColor('#FDF1F1'),
          child: Column(
            children: [
              SvgPicture.network(
                width: double.infinity,
                height: 102,
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg',
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#$id',
                    style: TextStyle(color: HexColor('#6B6B6B'), fontSize: 12),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    results.name!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Grass, Poison',
                    style: TextStyle(color: HexColor('#6B6B6B'), fontSize: 12),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
