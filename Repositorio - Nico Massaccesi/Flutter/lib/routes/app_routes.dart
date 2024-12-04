import 'package:tema1_actividad1/screens/screens.dart';

class AppRoutes {
  // Definir nombres para las rutas
  static const String home = '/';
  static const String fotosFila = '/fotos_fila';
  static const String fotosColumna = '/fotos_columna';
  static const String iconos = '/iconos';
  static const String reto = '/reto';
  static const String piramide = '/piramide';
  static const String contador = '/contador';
  static const String instagram = '/instagram';
  static const String juego = '/juego';
  static const String sieteYMedia = '/siete_y_media';
  static const String formulario = '/formulario';


  // Mapa de rutas
  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    fotosFila: (context) => const FotosEnFila(),
    fotosColumna: (context) => const FotosEnColumna(),
    iconos: (context) => const Iconos(),
    reto: (context) => const Reto(),
    piramide: (context) => const Piramide(),
    contador: (context) => const Contador(),
    instagram: (context) => const Instagram(),
    juego: (context) => Juego(),
    sieteYMedia: (context) => SieteYMedia(),
    formulario: (context) => Formulario(),
  };

  
}


    