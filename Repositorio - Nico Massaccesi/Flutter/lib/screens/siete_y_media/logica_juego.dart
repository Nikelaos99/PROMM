import 'dart:math';

// Clase que representa una carta en el juego
class Carta {
  final String palo;
  final String valor;
  final double puntuacion;

  Carta(this.palo, this.valor, this.puntuacion);
}

// Lógica del juego de Siete y Media
class LogicaJuego {
  final List<Carta> _baraja = [];
  final Random _aleatorio = Random();
  double _puntuacionJugador = 0.0;
  double _puntuacionMaquina = 0.0;
  bool _juegoTerminado = false;
  bool _maquinaHaJugado = false;

  // Constructor que inicializa la baraja
  LogicaJuego() {
    _inicializarBaraja();
  }

  // Método para inicializar la baraja con todas las cartas
  void _inicializarBaraja() {
    final palos = ['Oros', 'Bastos', 'Espadas', 'Copas'];
    final valores = [
      {'valor': '1', 'puntuacion': 1.0},
      {'valor': '2', 'puntuacion': 2.0},
      {'valor': '3', 'puntuacion': 3.0},
      {'valor': '4', 'puntuacion': 4.0},
      {'valor': '5', 'puntuacion': 5.0},
      {'valor': '6', 'puntuacion': 6.0},
      {'valor': '7', 'puntuacion': 7.0},
      {'valor': 'Sota', 'puntuacion': 0.5},
      {'valor': 'Caballo', 'puntuacion': 0.5},
      {'valor': 'Rey', 'puntuacion': 0.5},
    ];

    // Añadir cartas a la baraja
    for (var palo in palos) {
      for (var valor in valores) {
        String valorCarta = valor['valor'] as String;
        double puntuacionCarta = valor['puntuacion'] as double;
        _baraja.add(Carta(palo, valorCarta, puntuacionCarta));
      }
    }
  }

  // Método para pedir una carta para el jugador
  Carta pedirCarta() {
    if (!_juegoTerminado && _baraja.isNotEmpty) {
      final carta = _baraja.removeAt(_aleatorio.nextInt(_baraja.length));
      _puntuacionJugador += carta.puntuacion;
      if (_puntuacionJugador > 7.5) {
        _juegoTerminado = true;
      }
      return carta;
    }
    return Carta("", "",
        0.0); // Retornar carta vacía si el juego ha terminado o la baraja está vacía
  }

  // Método para que el jugador se plante
  void plantarse() {
    _jugarMaquina();
    _juegoTerminado = true;
  }

  // Método para simular el turno de la máquina
  void _jugarMaquina() {
    while (_puntuacionMaquina < 5.5 && !_juegoTerminado) {
      final carta = _baraja.removeAt(_aleatorio.nextInt(_baraja.length));
      _puntuacionMaquina += carta.puntuacion;
      _maquinaHaJugado = true;
      if (_puntuacionMaquina > 7.5) {
        _juegoTerminado = true;
      }
    }

    // La máquina se planta si tiene 5.5 puntos o más
    if (_puntuacionMaquina >= 5.5 && _puntuacionMaquina <= 7.5) {
      _juegoTerminado = true;
    }
  }

  // Método para reiniciar la ronda
  void reiniciarRonda() {
    _puntuacionJugador = 0.0;
    _puntuacionMaquina = 0.0;
    _juegoTerminado = false;
    _maquinaHaJugado = false;
    _baraja.clear();
    _inicializarBaraja();
  }

  // Método para reiniciar el juego completo
  void reiniciarJuego() {
    reiniciarRonda();
  }

  // Getters para acceder a las puntuaciones y estados
  double get puntuacionJugador => _puntuacionJugador;
  double get puntuacionMaquina => _puntuacionMaquina;
  bool get maquinaHaJugado => _maquinaHaJugado;
  bool juegoTerminado() => _juegoTerminado;
}
