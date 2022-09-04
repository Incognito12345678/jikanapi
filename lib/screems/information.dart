import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:apijikan/models/data.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

class Information extends StatefulWidget {
  //const Information({Key? key}) : super(key: key);

  final DataApi recibirdatos;

  Information({required this.recibirdatos});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Image.network(
                  widget.recibirdatos.image,
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: double.infinity,
                  height: 900,
                  child: Card(
                    elevation: 8,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 250),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.recibirdatos.title,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              Text(
                                widget.recibirdatos.titlejapan,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              InkWell(
                                onTap: () async {
                                  // ignore: deprecated_member_use
                                  await launch(widget.recibirdatos.urlyoutube
                                      .toString());
                                },
                                child: Text(
                                  widget.recibirdatos.urlyoutube ??
                                      'No hay trailer',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors
                                        .blue, // ignore: prefer_const_constructors
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Episodios: ${widget.recibirdatos.episodes}",
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.recibirdatos.sinopsis,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
