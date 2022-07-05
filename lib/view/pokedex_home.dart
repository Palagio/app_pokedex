import 'package:app_pokedex/controller/pokemon_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokedexList extends StatefulWidget {
  const PokedexList({Key? key}) : super(key: key);

  @override
  State<PokedexList> createState() => _PokedexListState();
}

class _PokedexListState extends State<PokedexList> {
 

  @override
  void initState() {
    context.read<PokemonController>().getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png'),
          )
        ],
        title: const Text('Pokedex'),
      ),
      body: Consumer<PokemonController>(builder: (_, controller, snapshot) {
        return ListView.builder(
          itemCount: controller.listaPokemons.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              leading: Image.network(
                  controller.listaPokemons[index].thumbnailImage ?? ''),
              trailing: Text(
                '${controller.listaPokemons[index].id}'
                    .padLeft(3, '0')
                    .padLeft(4, '#'),
                style: const TextStyle(color: Colors.grey),
              ),
              title: Text(controller.listaPokemons[index].name ?? ''),
              onTap: () => Navigator.of(context).pushNamed('/two',
                  arguments: controller.listaPokemons[index]),
            ));
          },
        );
      }),
    );
  }
}
