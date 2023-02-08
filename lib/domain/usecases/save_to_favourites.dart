import 'package:pokemon/core/usecase/base_usecase.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';

class SaveToFavourites extends BaseUseCase<Future<bool>, Params> {
  final PokemonRepository repo;
  const SaveToFavourites(this.repo);

  @override
  Future<bool> execute(Params params) async {
    return await repo.saveToFavouritesList(params.id);
  }
}

class Params {
  final String id;
  const Params(
    this.id,
  );
}
