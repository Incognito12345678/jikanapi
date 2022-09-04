import 'package:flutter/material.dart';

class Degradado extends StatelessWidget {
  const Degradado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //crea un degradado oscuro
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
