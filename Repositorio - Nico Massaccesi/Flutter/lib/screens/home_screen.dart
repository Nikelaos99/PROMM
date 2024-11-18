import 'package:tema1_actividad1/screens/screens.dart';

import 'package:google_fonts/google_fonts.dart';


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