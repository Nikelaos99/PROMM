import 'package:flutter/material.dart';
import 'package:tema1_actividad1/screens/screens.dart';

class NavegacionDrawer extends StatelessWidget {
  const NavegacionDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            Expanded(
              child: buildMenuItems(context),
            ),
          ],
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

Widget buildMenuItems(BuildContext context) => ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Nombre y Repositorio'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        ListTile(
          leading: const Icon(Icons.table_rows),
          title: const Text('Fotos en Fila'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/fotos_fila');
          },
        ),
        ListTile(
          leading: const Icon(Icons.view_column),
          title: const Text('Fotos en Columna'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/fotos_columna');
          },
        ),
        ListTile(
          leading: const Icon(Icons.workspaces_outline),
          title: const Text('Iconos'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/iconos');
          },
        ),
        ListTile(
          leading: const Icon(Icons.star),
          title: const Text('Reto'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/reto');
          },
        ),
        ListTile(
          leading: const Icon(Icons.keyboard_arrow_up_outlined),
          title: const Text('Pirámide'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/piramide');
          },
        ),
        ListTile(
          leading: const Icon(Icons.numbers),
          title: const Text('Contador'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/contador');
          },
        ),
        ListTile(
          leading: const Icon(Icons.camera_alt),
          title: const Text('Instagram'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/instagram');
          },
        ),
        ListTile(
          leading: const Icon(Icons.gamepad),
          title: const Text('Juego'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/juego');
          },
        ),
        ListTile(
          leading: const Icon(Icons.casino_rounded),
          title: const Text('Siete y Media'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/siete_y_media');
          },
        ),
        ListTile(
          leading: const Icon(Icons.text_snippet_outlined),
          title: const Text('Formulario'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/formulario');
          },
        ),
        ListTile(
          leading: const Icon(Icons.text_snippet_outlined),
          title: const Text('Formulario 2'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/formulario2');
          },
        ),
      ],
    );
