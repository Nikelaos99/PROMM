import 'package:flutter/material.dart';
import 'package:tema1_actividad1/main.dart';


class FotosEnFila extends StatelessWidget {
  const FotosEnFila({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: const NavegacionDrawer(),
    appBar: AppBar(
      title: const Text('Fotos en Fila'),
      backgroundColor: Colors.yellow,
    ),
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://picsum.photos/50?image=10',
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 10),
          Image.network(
            'https://picsum.photos/50?image=20',
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 10),
          Image.network(
            'https://picsum.photos/50?image=30',
            width: 50,
            height: 50,
          ),
        ],
      ),
    ),
  );
}

