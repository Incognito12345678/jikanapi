import 'dart:convert';
import 'package:apijikan/screems/information.dart';
import 'package:http/http.dart' as http;

import 'package:apijikan/models/data.dart';
import 'package:flutter/material.dart';

class Api extends StatefulWidget {
  //Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  //se convierte en un objeto dart
  Future<List<DataApi>> fetchdata() async {
    final response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/anime'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final list = data['data'] as List;
      //final list = data['data']["title"] as List;
      //return list.map((e) => DataApi(image: e)).toList();
      return list
          .map((e) => DataApi(
                image: e["images"]["jpg"]["image_url"],
                //title: e["titles"]["title"]
                title: e["title"],
                titlejapan: e["title_japanese"],
                episodes: e["episodes"].toString(),
                sinopsis: e["synopsis"],
                urlyoutube: e["trailer"]["url"],

                //title: e["titles"][0]["title"]
              ))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DataApi>>(
      future: fetchdata(),
      builder: (BuildContext context, AsyncSnapshot<List<DataApi>> snapshot) {
        if (snapshot.hasData) {
          final lista = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lista.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Information(
                          recibirdatos: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        lista[index].image,
                        fit: BoxFit.cover,

                        //dale un espacio entre cada imagen
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
