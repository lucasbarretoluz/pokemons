import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/data/datasources/api.dart';
import 'package:pokemon/data/models/pokemon_detail_model.dart';
import 'package:pokemon/data/models/pokemon_model.dart';

class RemoteDataSource {
  final http.Client client;

  RemoteDataSource(this.client);

  Future<PokemonResponseModel> getPokemons(String? url) async {
    Uri queryString = Uri.parse(url ?? Api.apiUrl);

    try {
      http.Response response = await client.get(
        queryString,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        PokemonResponseModel modelResponse =
            PokemonResponseModel.fromJson(json.decode(response.body));
        return modelResponse;
      }
    } catch (e) {
      throw Exception();
    }
    throw Exception();
  }

  Future<PokemonDetail> getPokemonByName(String name) async {
    Uri queryString = Uri.parse('${Api.apiUrl}/$name');
    try {
      http.Response response = await client.get(queryString);
      if (response.statusCode == 200) {
        PokemonDetail modelResponse =
            PokemonDetail.fromJson(json.decode(response.body));
        return modelResponse;
      }
    } catch (e) {
      throw Exception();
    }
    throw Exception();
  }
}
