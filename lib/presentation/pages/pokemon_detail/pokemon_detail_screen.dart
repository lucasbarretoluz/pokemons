import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/constants/theme.dart';
import 'package:pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:pokemon/presentation/pages/pokemon_detail/pokemon_detail_controller.dart';
import 'package:pokemon/presentation/widgets/pokemon_detail_header.dart';
import 'package:pokemon/presentation/widgets/pokemon_shape_info.dart';
import 'package:pokemon/presentation/widgets/pokemon_stat_widget.dart';

class PokemonDetailScreen extends ConsumerStatefulWidget {
  final PokemonDetailEntity pokemonDetailEntity;
  const PokemonDetailScreen({
    Key? key,
    required this.pokemonDetailEntity,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends ConsumerState<PokemonDetailScreen> {
  @override
  void initState() {
    ref
        .read(pokemonDetailControllerProvider)
        .checkIffavourite(widget.pokemonDetailEntity.name.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          bool isFavourite = ref.watch(pokemonStateProvider);
          return FloatingActionButton.extended(
            label: Text(
              isFavourite ? 'Remove from favourites' : 'Mark as favourite',
              style: TextStyle(
                  color:
                      isFavourite ? ThemeColors.primaryColor : Colors.white),
            ),
            backgroundColor: isFavourite
                ? ThemeColors.lightBlue
                : ThemeColors.primaryColor,
            onPressed: () async {
              if (!isFavourite) {
                await ref
                    .read(pokemonDetailControllerProvider)
                    .markAsFavourite(widget.pokemonDetailEntity);
              } else {
                await ref
                    .read(pokemonDetailControllerProvider)
                    .removeFromFavourites(widget.pokemonDetailEntity);
              }
            },
          );
        },
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: const BackButton(color: ThemeColors.fontPrimaryColor),
            pinned: true,
            backgroundColor: Colors.green[50],
            expandedHeight: 50,
            forceElevated: true,
            elevation: 2,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                PokemonDetailHeader(
                    pokemonDetailEntity: widget.pokemonDetailEntity),
                PokemonShapeInfo(
                    pokemonDetailEntity: widget.pokemonDetailEntity),
                PokemonStatWidget(
                  pokemonDetailEntity: widget.pokemonDetailEntity,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
