import 'dart:async';
import 'dart:math';
import 'package:tema1_actividad1/screens/screens.dart';

// Clase principal del juego
class Juego extends StatelessWidget {
  const Juego({super.key});

  @override
  Widget build(BuildContext context) {
    return JuegoAux();
  }
}

// Widget con estado que controla el juego
class JuegoAux extends StatefulWidget {
  const JuegoAux({super.key});

  @override
  _JuegoState createState() => _JuegoState();
}

class _JuegoState extends State<JuegoAux> {
  int _puntos = 0; // Puntuación del jugador
  Random _random = Random(); // Generador de números aleatorios
  Offset _posicionImagen = Offset.zero; // Posición de la imagen en pantalla
  Timer? _timer; // Temporizador para controlar el tiempo
  int _tiempoRestante =
      3; // Tiempo restante en segundos para hacer clic en la imagen
  late String _imagenUrl; // URL de la imagen actual
  List<String> _mensajesPuntosPerdidos = ['Oh no!','Ánimo!','Ups!','Vaya!','Lo siento!'];

  @override
  void initState() {
    super.initState();
    _imagenUrl = _generarUrlImagen(); // Inicializa la URL de la imagen
    _iniciarJuego(); // Inicia el juego
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _moverImagen(); // Mueve la imagen a una nueva posición
  }

  // Configura e inicia el temporizador del juego
  void _iniciarJuego() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _tiempoRestante -= 1;
        if (_tiempoRestante <= 0) {
          _puntos -= 2; // Resta puntos si no se hace clic a tiempo

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text(_mensajesPuntosPerdidos[_random.nextInt(_mensajesPuntosPerdidos.length)]),))); // Imprime un mensaje aleatorio de los mensajes de perdida de puntos.

          _moverImagen(); // Mueve la imagen
          _tiempoRestante = 3; // Restablece el tiempo
        }
      });
    });
  }

  // Genera una nueva posición aleatoria para la imagen
  void _moverImagen() {
    setState(() {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      double offsetX, offsetY;

      // Evita el área del texto "Puntos" y "Tiempo", y los bordes de pantalla
      do {
        offsetX = _random.nextDouble() * (screenWidth - 100);
        offsetY = _random.nextDouble() * (screenHeight - 150);
      } while ((offsetX < 150 && offsetY < 150) ||
          (offsetX > screenWidth - 150 && offsetY < 150) ||
          (offsetX > screenWidth - 100) ||
          (offsetY > screenHeight - 100));

      _posicionImagen =
          Offset(offsetX, offsetY); // Actualiza la posición de la imagen
      _imagenUrl = _generarUrlImagen(); // Genera una nueva URL para la imagen
    });
  }

  // Genera una URL aleatoria para la imagen desde picsum.photos
  String _generarUrlImagen() {
    return 'https://picsum.photos/seed/${_random.nextInt(1000)}/100';
  }

  // Maneja el evento de hacer clic en la imagen
  void _imagenPulsada() {
    setState(() {
      _puntos += 1; // Suma un punto al puntaje
      _moverImagen(); // Mueve la imagen a una nueva posición
      _tiempoRestante = 3; // Restablece el tiempo
      switch (_puntos) {
        case 5:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('¡Bravo! Has alcanzado 5 puntos. Estás en el camino correcto, sigue así. 🌟'),)));
          break;
        case 20:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('¡Impresionante! Has llegado a 20 puntos. Cada vez te acercas más a tu objetivo. ¡Sigue adelante! 🚀'),)));
          break;
        case 50:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('¡Increíble! Has alcanzado 50 puntos. Estás demostrando una gran habilidad y determinación. ¡No pares ahora! 🏅'),)));
          break;
        case 100:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('¡Felicidades! 100 puntos alcanzados. Este es un logro significativo y muestra tu dedicación y esfuerzo. ¡Eres imparable! 💯'),)));
          break;
        case 500:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('¡Impresionante! Has alcanzado 500 puntos. Tu dedicación y habilidades te están llevando muy lejos. ¡Sigue así, campeón! 🏆🌟'),)));
          break;
        case 1000:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text('¡Asombroso! Has llegado a 1000 puntos. Este es un logro excepcional y demuestra tu talento y perseverancia. ¡Eres una leyenda! 🌟🏆'),)));
          break;
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el temporizador cuando el widget se elimina
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavegacionDrawer(), // Menú de navegación
      appBar: AppBar(
        title: Text('Juego de Imágenes'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          // Fondo con un diseño bonito (degradado)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.redAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Imagen en posición aleatoria
          Positioned(
            left: _posicionImagen.dx,
            top: _posicionImagen.dy,
            child: GestureDetector(
              onTap: _imagenPulsada,
              child: Image.network(
                _imagenUrl,
                width: 100,
                height: 100,
              ),
            ),
          ),
          // Muestra la puntuación del jugador
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Puntos: $_puntos',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          // Muestra el tiempo restante
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Tiempo: $_tiempoRestante',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
