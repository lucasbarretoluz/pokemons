import 'package:flutter/material.dart';
import 'package:pokemon/domain/entities/pokemon_detail_entity.dart';

class PokemonDetailHeader extends StatelessWidget {
  final PokemonDetailEntity pokemonDetailEntity;
  const PokemonDetailHeader({
    Key? key,
    required this.pokemonDetailEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.green[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 23,
                    ),
                    Text(
                      pokemonDetailEntity.name.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      pokemonDetailEntity.speciesTypes.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Text(
                  '#${pokemonDetailEntity.id.toString()}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.network(
                pokemonDetailEntity.imageUrl,
                height: 125,
                width: 136,
              ),
            ],
          )
        ],
      ),
    );
  }
}
