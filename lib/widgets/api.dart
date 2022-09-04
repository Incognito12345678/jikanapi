/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/data.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late Future<List<DataApi>> listado;

  Future<List<DataApi>> fetchapi() async {
    final response =
        await http.get(Uri.parse('https://api.jikan.moe/v4/anime'));

    List<DataApi> data = [];

    if (response.statusCode == 200) {
      final apidata = json.decode(response.body) as Map<String, dynamic>;

      for (var item in apidata['data']) {
        data.add(DataApi(
          image: item['image_url'],
        ));
      }
      return data;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    listado = fetchapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime'),
      ),
      body: FutureBuilder<List<DataApi>>(
        future: listado,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: listdata(snapshot.data),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }

  List<Widget> listdata(List<DataApi> data) {
    List<Widget> list = [];

    for (var dataapi in data) {
      list.add(
        Container(
          child: Image.network(dataapi.image),
        ),
      );
    }
    return list;
  }
}*/
