import 'package:flutter/material.dart';
import 'package:hangman/game/game_widget.dart';
import 'package:hangman/loading/loading_widget.dart';
import 'package:hangman/about/about_widget.dart';

void main() => runApp(HangmanApp());

class HangmanApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le pendu numérique',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingWidget(),
        '/game': (context) => GameWidget(),
        '/about': (context) => AboutWidget(),
      },
    );
  }
}

