import 'package:app_pokedex/controller/pokemon_controller.dart';
import 'package:app_pokedex/models/api/repository.dart';
import 'package:app_pokedex/view/pokedex_details.dart';
import 'package:app_pokedex/view/pokedex_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final repository = Repository();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PokemonController(repository))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PokedexList(),
        '/two': (context) => const PokedexInfo(),
      },
    );
  }
}
