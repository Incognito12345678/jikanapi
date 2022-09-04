import 'package:apijikan/widgets/apinew.dart';
import 'package:flutter/material.dart';

import '../widgets/degradadodark.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(children: [
              Image.asset(
                'assets/anime.jpg',
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
              const Degradado(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/crunchy.jpg',
                          width: 45,
                        ),
                        const Text(
                          'Programas',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        const Text(
                          'Peliculas',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        const Text(
                          'Mi lista',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Peliculas',
                          style: TextStyle(fontSize: 30, color: Colors.black),
                        ),
                      ],
                    ),
                    Api(),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
