import 'package:flutter/material.dart';
import 'package:tema1_actividad1/screens/screens.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Mi aplicacion",
    initialRoute: "/",
    routes: {
      '/': (context) => const HomePage(),
      '/fotos_fila': (context) => const FotosEnFila(),
      '/fotos_columna': (context) => const FotosEnColumna(),
      '/iconos': (context) => const Iconos(),
      '/reto': (context) => const Reto(),
      '/piramide': (context) => const Piramide(),
      '/contador': (context) => const Contador(),
      '/instagram': (context) => const Instagram(),
      '/juego': (context) => Juego(),
    },
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (BuildContext builder) => HomePage());
    },
  ));
}
