import 'package:flutter/material.dart';

// Widget que representa una carta individual en el juego
class CartaWidget extends StatelessWidget {
  final String palo; // Palo de la carta (Oros, Bastos, Espadas, Copas)
  final String valor; // Valor de la carta (1, 2, 3, ..., Sota, Caballo, Rey)

  // Constructor que recibe el palo y el valor de la carta
  const CartaWidget({super.key, required this.palo, required this.valor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Ajustar tamaño de la columna al contenido
        children: [
          // Imagen de la carta basada en su valor y palo
          Image.asset(
              'assets/images/siete_y_media/${valor.toLowerCase()}_${palo.toLowerCase()}.jpg',
              width: 100,
              height: 100),
          SizedBox(height: 10), // Espacio entre la imagen y el texto
          Text(valor,
              style: TextStyle(
                  fontSize: 16)), // Texto que muestra el valor de la carta
          Text(palo,
              style: TextStyle(
                  fontSize: 16)), // Texto que muestra el palo de la carta
        ],
      ),
    );
  }
}
