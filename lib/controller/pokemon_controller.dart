import 'package:flutter/cupertino.dart';

import '../models/api/repository.dart';
import '../models/pokemon_model.dart';

class PokemonController with ChangeNotifier {
  final Repository repository;
  PokemonController(
    this.repository,
  );

  List<Pokemon> listaPokemons = [];

  void getPokemons() async {
    listaPokemons = await repository.getPokemon();
  }
}
