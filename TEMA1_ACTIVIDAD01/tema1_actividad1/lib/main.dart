import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tema1_actividad1/fotos_en_columna.dart';
import 'package:tema1_actividad1/fotos_en_fila.dart';
import 'package:tema1_actividad1/iconos.dart';
import 'package:tema1_actividad1/piramide.dart';
import 'package:tema1_actividad1/reto.dart';
import 'package:tema1_actividad1/contador.dart';

void main() {
  runApp(const MaterialApp(title: "Mi aplicacion", home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.red.shade200,
        ),
        drawer: const NavegacionDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nicolás Massaccesi',
                style: GoogleFonts.lobster(fontSize: 32, color: Colors.black),
              ),
              Text(
                'https://github.com/Nikelaos99/PROMM',
                style: GoogleFonts.roboto(fontSize: 24, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
}

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
      ],
    );
