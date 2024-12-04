import 'package:tema1_actividad1/screens/screens.dart';
import 'siete_y_media/logica_juego.dart';
import 'siete_y_media/carta_widget.dart';

// Clase principal que representa la pantalla del juego Siete y Media
class SieteYMedia extends StatelessWidget {
  const SieteYMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return JuegoSieteYMedia();
  }
}

// Widget con estado que contiene la lógica del juego Siete y Media
class JuegoSieteYMedia extends StatefulWidget {
  @override
  _JuegoSieteYMediaState createState() => _JuegoSieteYMediaState();
}

class _JuegoSieteYMediaState extends State<JuegoSieteYMedia> {
  final LogicaJuego _logicaJuego = LogicaJuego();
  String _mensaje = '¡Bienvenido a Siete y Media!';
  int _victoriasJugador = 0;
  int _victoriasMaquina = 0;
  List<Carta> _cartasJugador = [];

  // Método para pedir una carta
  void _pedirCarta() {
    setState(() {
      Carta carta = _logicaJuego.pedirCarta();
      _cartasJugador.add(carta);
      if (_logicaJuego.juegoTerminado()) {
        _determinarGanadorRonda();
      } else {
        _mensaje = 'Tu puntuación: ${_logicaJuego.puntuacionJugador}';
      }
    });
  }

  // Método para que el jugador se plante
  void _plantarse() {
    setState(() {
      _logicaJuego.plantarse();
      _determinarGanadorRonda();
    });
  }

  // Método para determinar el ganador de la ronda
  void _determinarGanadorRonda() {
    String puntuacionMaquina = _logicaJuego.maquinaHaJugado
        ? '${_logicaJuego.puntuacionMaquina}'
        : 'No ha jugado';
    if (_logicaJuego.puntuacionJugador > 7.5) {
      _victoriasMaquina++;
      _mensaje = '¡Te pasaste! La máquina gana esta ronda.\n' +
          'Tu puntuación: ${_logicaJuego.puntuacionJugador}\n' +
          'Puntuación de la máquina: $puntuacionMaquina';
    } else if (_logicaJuego.puntuacionMaquina > 7.5 ||
        _logicaJuego.puntuacionJugador > _logicaJuego.puntuacionMaquina) {
      _victoriasJugador++;
      _mensaje = '¡Ganaste esta ronda!\n' +
          'Tu puntuación: ${_logicaJuego.puntuacionJugador}\n' +
          'Puntuación de la máquina: $puntuacionMaquina';
    } else if (_logicaJuego.puntuacionMaquina ==
        _logicaJuego.puntuacionJugador) {
      _mensaje = '¡Empate en esta ronda!\n' +
          'Tu puntuación: ${_logicaJuego.puntuacionJugador}\n' +
          'Puntuación de la máquina: $puntuacionMaquina';
    } else {
      _victoriasMaquina++;
      _mensaje = 'La máquina gana esta ronda.\n' +
          'Tu puntuación: ${_logicaJuego.puntuacionJugador}\n' +
          'Puntuación de la máquina: $puntuacionMaquina';
    }
    if (_victoriasJugador == 5) {
      _mensaje = '¡Felicitaciones! Has ganado el juego.';
    } else if (_victoriasMaquina == 5) {
      _mensaje = 'La máquina ha ganado el juego.';
    } else {
      _mensaje +=
          '\n\nPuntuación final:\nTú $_victoriasJugador - Máquina $_victoriasMaquina';
      _logicaJuego.reiniciarRonda();
      _cartasJugador.clear();
    }
  }

  // Método para reiniciar el juego completo
  void _reiniciarJuego() {
    setState(() {
      _logicaJuego.reiniciarJuego();
      _victoriasJugador = 0;
      _victoriasMaquina = 0;
      _mensaje = '¡Bienvenido a Siete y Media!';
      _cartasJugador.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavegacionDrawer(), // Drawer para la navegación
      appBar: AppBar(
        title: Text('Siete y Media'), // Título de la AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar los elementos
          children: <Widget>[
            Center(
              child: Text(
                _mensaje,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20), // Espacio entre el texto y las cartas
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _cartasJugador
                  .map((carta) =>
                      CartaWidget(palo: carta.palo, valor: carta.valor))
                  .toList(),
            ),
            SizedBox(height: 20), // Espacio entre las cartas y los botones
            ElevatedButton(
              onPressed: _logicaJuego.juegoTerminado() ? null : _pedirCarta,
              child: Text('Pedir Carta'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logicaJuego.juegoTerminado() ? null : _plantarse,
              child: Text('Plantarse'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _reiniciarJuego,
              child: Text('Reiniciar Juego'),
            ),
          ],
        ),
      ),
    );
  }
}
