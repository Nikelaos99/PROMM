import 'package:flutter/material.dart';
import 'package:tema1_actividad1/main.dart';

class Piramide extends StatelessWidget {
  const Piramide({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavegacionDrawer(),
        appBar: AppBar(
          title: const Text('Pirámide'),
          backgroundColor: Colors.amber,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset('assets/images/capybara.jpg',
                          width: 100, height: 100),
                      Text('Capybara'),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset('assets/images/conejo.jpg',
                          width: 100, height: 100),
                      Text('Conejo'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: <Widget>[
                      Image.asset('assets/images/huron.jpg',
                          width: 100, height: 100),
                      Text('Hurón'),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Image.asset('assets/images/perro.jpg',
                          width: 100, height: 100),
                      Text('Perro'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: <Widget>[
                      Image.asset('assets/images/cacatua.jpg',
                          width: 100, height: 100),
                      Text('Cacatúa'),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: <Widget>[
                      Image.asset('assets/images/gato.jpg',
                          width: 100, height: 100),
                      Text('Gato'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
