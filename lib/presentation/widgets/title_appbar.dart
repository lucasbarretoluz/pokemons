import 'package:flutter/material.dart';
import 'package:pokemon/constants/constante_imagens.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Pokemons',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 8),
        Image.asset(
          ImageConstants.pokeballIcon,
          height: 24,
          width: 24,
        ),
      ],
    );
  }
}
