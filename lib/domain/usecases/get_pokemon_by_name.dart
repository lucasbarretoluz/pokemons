import 'package:pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/core/usecase/base_usecase.dart';

class GetPokemonByName
    extends BaseUseCase<Future<PokemonDetailEntity>, Params> {
  final PokemonRepository repo;
  const GetPokemonByName(this.repo);

  @override
  Future<PokemonDetailEntity> execute(Params params) async {
    return await repo.getPokemonByName(params.name);
  }
}

class Params {
  final String name;
  const Params({
    required this.name,
  });
}
