import 'package:flutter/material.dart';
import 'package:pokemon/constants/theme.dart';
import 'package:pokemon/domain/entities/pokemon_detail_entity.dart';

class PokemonWidget extends StatelessWidget {
  final PokemonDetailEntity pokemonDetail;
  final Function onTap;
  const PokemonWidget({
    Key? key,
    required this.pokemonDetail,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: (MediaQuery.of(context).size.width - 40) / 3,
          height: 186,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width - 40) / 3,
                color: Colors.green[50],
                child: Image.network(
                  pokemonDetail.imageUrl,
                  height: 104,
                  width: 104,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                width: (MediaQuery.of(context).size.width - 40) / 3,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pokemonDetail.id.toString(),
                      style: const TextStyle(
                        color: ThemeColors.fontPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      pokemonDetail.name.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      pokemonDetail.speciesTypes.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: ThemeColors.fontPrimaryColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
