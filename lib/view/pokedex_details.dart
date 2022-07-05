import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class PokedexInfo extends StatelessWidget {
  const PokedexInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pokemon pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;

    List tipos = [];
    for (var element in pokemon.type as List) {
      tipos.add(element);
    }

    List fraquezas = [];
    for (var element in pokemon.weakness as List) {
      fraquezas.add(element);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(pokemon.name ?? ''),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: const Color(0xFFd3d3d3),
                          image: DecorationImage(
                            image: NetworkImage(pokemon.thumbnailImage ?? ''),
                            fit: BoxFit.fitHeight,
                          ),
                          border: Border.all(
                            width: 3,
                            color: const Color(0xFFd3d3d3),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        pokemon.number
                            .toString()
                            .padLeft(3, '0')
                            .padLeft(4, '#'),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      pokemon.description ?? '',
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: const Text(
                          'Tipos:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: tipos.map<Widget>((e) {
                      return Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(e),
                      );
                    }).toList(),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          'Fraquezas:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: fraquezas.map<Widget>((e) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(e),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
