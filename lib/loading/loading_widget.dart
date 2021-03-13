import 'package:flutter/material.dart';
import 'dart:convert' as convert;
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
    List<String> categories = await Future.delayed(Duration(milliseconds: 100), () {
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

    Navigator.pushReplacementNamed(context, '/game', arguments: { 'categories': categories });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Loading...',
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none,
          letterSpacing: 2,
          color: Colors.orange[500],
          fontFamily: 'IndieFlower',
        ),
      ),
    );
  }
}
