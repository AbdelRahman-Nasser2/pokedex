import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/allpokemonsmodel.dart';
import 'package:pokedex/models/pokemonmodel.dart';
import 'package:pokedex/shared/cubit/states.dart';
import 'package:pokedex/shared/network/remote/end_points.dart';
import 'package:pokedex/shared/network/remote/http_Helper/http.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  AllPokemonsModel? allPokemonsModel;

  void getHomeData() {
    emit(HomeGetDataLoading());
    HTTP.getHomeData(HOME).then((value) async {
      allPokemonsModel = AllPokemonsModelFromJson(value.body);
      emit(HomeGetDataSuccess());
    }).catchError((error) {
      emit(HomeGetDataError(error));
    });
  }

  PokemonModel? pokemonModel;
  void getPokemonData(String? url) {
    emit(PokemonGetDataLoading());
    HTTP.getHomeData(url).then((value) async {
      pokemonModel = PokemonModelFromJson(value.body);
      emit(PokemonGetDataSuccess());
    }).catchError((error) {
      emit(PokemonGetDataError(error));
    });
  }
}
