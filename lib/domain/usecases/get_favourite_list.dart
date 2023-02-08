import 'package:pokemon/core/usecase/base_usecase.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';

class GetFavouriteList extends BaseUseCase<List<String>, Params> {
  final PokemonRepository repo;
  const GetFavouriteList(this.repo);

  @override
  List<String> execute(Params params) {
    return repo.fetchFavourites();
  }
}

class Params {}
