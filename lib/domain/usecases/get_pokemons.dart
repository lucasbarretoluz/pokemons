import 'package:pokemon/domain/entities/pokemon_response_entity.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/core/usecase/base_usecase.dart';

class GetPokemons extends BaseUseCase<Future<PokemonResponseEntity>, Params> {
  final PokemonRepository repo;
  const GetPokemons(this.repo);

  @override
  Future<PokemonResponseEntity> execute(Params params) async {
    return await repo.getPokemons(params.url);
  }
}

class Params {
  final String? url;
  const Params(
    this.url,
  );
}
