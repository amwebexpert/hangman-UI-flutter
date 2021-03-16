import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinner;
import 'package:hangman/services/hangman_service.dart';
import 'package:http/http.dart' as http;

class LoadingWidget extends StatefulWidget {
  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  HangmanService service = HangmanService.INSTANCE;

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

    await service.loadData();
    print(service.entries);

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
