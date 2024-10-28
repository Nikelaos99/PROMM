import 'package:flutter/material.dart';

class InstagramBottom extends StatefulWidget {
  const InstagramBottom({super.key});

  @override
  State<InstagramBottom> createState() => InstagramBottomState();
}

class InstagramBottomState extends State<InstagramBottom> {
  bool muestraGrid = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/instagram/nuevo.jpg'),
                        ),
                        border: Border.all(color: Colors.black, width: 1)),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Nuevo",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/instagram/pilotando.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.black, width: 1)),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Pilotando",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/instagram/francia.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.black, width: 1)),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Francia",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/instagram/arquitectura.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.black, width: 1)),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Arquitectura",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/instagram/retrato.jpg'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(color: Colors.black, width: 1)),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Retratos",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.grid_on_rounded, size: 30),
              onPressed: () {
                setState(() {
                  muestraGrid = true;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.person_pin_sharp, size: 30),
              onPressed: () {
                setState(() {
                  muestraGrid = false;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 220,
              child: muestraGrid
                  ? GridView.count(
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      crossAxisCount: 3,
                      children: List.generate(9, (index) {
                        return SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/images/instagram/grid${index + 1}.jpg',
                            fit: BoxFit.cover,
                          ),
                        );
                      }),
                    )
                  : Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/instagram/relax.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Icon(Icons.home_rounded, size: 40),
            const Icon(Icons.search_rounded, size: 40),
            const Icon(Icons.add_circle, size: 40),
            const Icon(Icons.favorite_rounded, size: 40),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                image: const DecorationImage(
                  image: AssetImage('assets/images/instagram/retrato.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
