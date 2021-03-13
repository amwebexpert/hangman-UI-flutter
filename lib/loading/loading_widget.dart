import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinner;
import 'package:http/http.dart' as http;

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    List<String> categories =
        await Future.delayed(Duration(milliseconds: 100), () {
      return ['Animaux', 'Transport'];
    });

    Uri url = Uri.https('jsonplaceholder.typicode.com', '/todos/1');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      print(jsonResponse['title']);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    Navigator.pushReplacementNamed(context, '/game',
        arguments: {'categories': categories});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: spinner.SpinKitWave(
      color: Colors.orange,
      size: 50,
    ));
  }
}
