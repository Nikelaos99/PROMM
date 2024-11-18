import 'package:tema1_actividad1/screens/screens.dart';
import 'package:tema1_actividad1/screens/instagram/instagram_top.dart';
import 'package:tema1_actividad1/screens/instagram/instagram_middle.dart';
import 'package:tema1_actividad1/screens/instagram/instagram_bottom.dart';

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        endDrawer: const NavegacionDrawer(),
        appBar: AppBar(
          title: const Row(
            children: [
              Text('gatogatonson'),
              Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
        body: const Column(
          children: [
            InstagramTop(), // Parte superior
            InstagramMiddle(), // Parte media
            InstagramBottom(), // Parte inferior
          ],
        ),
      );
}
