import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/constants/theme.dart';
import 'package:pokemon/constants/constante_imagens.dart';
import 'package:pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:pokemon/presentation/pages/home/home_page_controller.dart';
import 'package:pokemon/presentation/widgets/all_pokemon_widget.dart';
import 'package:pokemon/presentation/widgets/favourites_widget.dart';
import 'package:pokemon/presentation/widgets/title_appbar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(homePageControllerProvider).getFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: TitleAppBar(),
            bottom: TabBar(
              indicatorWeight: 4,
              indicatorColor: ThemeColors.primaryColor,
              tabs: [
                const Tab(
                  child: Text(
                    'Pokemons',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      const Text(
                        'Favoritos',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Consumer(builder: (context, ref, child) {
                        List<PokemonDetailEntity> favouriteList =
                            ref.watch(favouriteListProvider);
                        int count = favouriteList.length;
                        return count == 0
                            ? const SizedBox.shrink()
                            : Container(
                                height: 20,
                                width: 20,
                                alignment: FractionalOffset.center,
                                decoration: BoxDecoration(
                                    color: ThemeColors.primaryColor,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Text(
                                  count.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              );
                      })
                    ],
                  ),
                ),
              ],
            )),
        body: const TabBarView(
          children: [
            AllPokemonWidget(),
            FavouritesWidget(),
          ],
        ),
      ),
    );
  }
}
