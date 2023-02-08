import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon/data/datasources/local_datasource/local_datasource.dart';
import 'package:pokemon/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/domain/usecases/check_if_favourite.dart';
import 'package:pokemon/domain/usecases/get_favourite_list.dart';
import 'package:pokemon/domain/usecases/get_pokemon_by_name.dart';
import 'package:pokemon/domain/usecases/get_pokemons.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon/domain/usecases/remove_from_favourites.dart';
import 'package:pokemon/domain/usecases/save_to_favourites.dart';

class Injector {
  static late Box box;

  static init() async {
    await LocalDatasource.start();
    box = await Hive.openBox('preferencias');
  }

  static RemoteDataSource remoteDataSource = RemoteDataSource(http.Client());
  static LocalDatasource localDatasource = LocalDatasource(box);
  static PokemonRepository pokemonRepository = PokemonRepositoryImpl(
      localDatasource: localDatasource, dataSource: remoteDataSource);
  static GetPokemons getPokemonsUsecase = GetPokemons(pokemonRepository);
  static GetPokemonByName getPokemonByNameUsecase =
      GetPokemonByName(pokemonRepository);
  static CheckIfFavourite checkIfFavouriteUsecase =
      CheckIfFavourite(pokemonRepository);
  static SaveToFavourites saveToFavouritesUsecase =
      SaveToFavourites(pokemonRepository);
  static GetFavouriteList getFavouriteListUsecase =
      GetFavouriteList(pokemonRepository);
  static RemoveFromFavourites removeFromFavouritesUseCase =
      RemoveFromFavourites(pokemonRepository);
}
