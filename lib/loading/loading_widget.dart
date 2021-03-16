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

    try {
      Uri url = Uri.https('esighclouddemo.appspot.com', '/api/v1/categories/64d28a1e-24cf-40f7-a6f1-3a76fd534639/texts');
      print(url);
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        Map jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Request failed: ${e.toString()}');
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
