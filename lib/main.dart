import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon/presentation/injector.dart';
import 'package:pokemon/presentation/pages/home/home_page.dart';
import 'package:pokemon/presentation/pages/pokemon_detail/pokemon_detail_screen.dart';
import 'package:pokemon/presentation/pages/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injector.init();
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Challenge',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'pokemonDetail') {
          final Map<String, dynamic> value =
              settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => PokemonDetailScreen(
              pokemonDetailEntity: value['detail'],
            ),
          );
        }
        return null;
      },
      routes: {
        '/home': (context) => const HomePage(),
      },
    );
  }
}
