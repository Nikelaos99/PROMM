import 'package:flutter/material.dart';
import 'package:tema1_actividad1/screens/home_screen.dart';
import 'package:tema1_actividad1/screens/fotos_en_columna.dart';
import 'package:tema1_actividad1/screens/fotos_en_fila.dart';
import 'package:tema1_actividad1/screens/iconos.dart';
import 'package:tema1_actividad1/screens/piramide.dart';
import 'package:tema1_actividad1/screens/reto.dart';
import 'package:tema1_actividad1/screens/contador.dart';
import 'package:tema1_actividad1/screens/instagram_main.dart';

class NavegacionDrawer extends StatelessWidget {
  const NavegacionDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
}

Widget buildHeader(BuildContext context) => Container(
      color: Colors.blue.shade700,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage('https://picsum.photos/250?image=22'),
          ),
          SizedBox(height: 12),
          Text(
            'Nicolás Massaccesi',
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          Text(
            'nicomassaccesi@outlook.com',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );

Widget buildMenuItems(BuildContext context) => Column(
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Nombre y Repositorio'),
          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          )),
        ),
        ListTile(
          leading: const Icon(Icons.table_rows),
          title: const Text('Fotos en Fila'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const FotosEnFila(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.view_column),
          title: const Text('Fotos en Columna'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const FotosEnColumna(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.workspaces_outline),
          title: const Text('Iconos'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Iconos(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.star),
          title: const Text('Reto'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Reto()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.keyboard_arrow_up_outlined),
          title: const Text('Pirámide'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Piramide()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.numbers),
          title: const Text('Contador'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Contador()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Instagram'),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Instagram()));
          },
        )
      ],
    );
