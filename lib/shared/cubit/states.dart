abstract class AppStates {}

class AppInitialState extends AppStates {}

class HomeGetDataLoading extends AppStates {}

class HomeGetDataSuccess extends AppStates {}

class HomeGetDataError extends AppStates {
  final dynamic error;

  HomeGetDataError(this.error);
}

class PokemonGetDataLoading extends AppStates {}

class PokemonGetDataSuccess extends AppStates {}

class PokemonGetDataError extends AppStates {
  final dynamic error;

  PokemonGetDataError(this.error);
}
