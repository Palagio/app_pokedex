import 'dart:convert';

import 'package:app_pokedex/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<List<Pokemon>> getPokemon() async {
    var url = Uri.parse('http://104.131.18.84/pokemon/');

    List<Pokemon> listaPokemons = [];
    final result = await http.get(url);

    if (result.statusCode == 200) {
      Map json = const JsonDecoder().convert(result.body);

      for (var e in (json['data'] as List)) {
        listaPokemons.add(Pokemon.fromJson(e));
      }

      return listaPokemons;
    }

    return listaPokemons;
  }
}
