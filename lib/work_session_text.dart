import 'package:flutter/material.dart';

import 'model/word_to_guess.dart';

class WordSessionText extends StatelessWidget {
  final WordToGuess wordToGuess;
  final bool isHiddenMode;

  WordSessionText({this.wordToGuess, this.isHiddenMode}) {}

  @override
  Widget build(BuildContext context) {
    String text = this.isHiddenMode ? wordToGuess.wordGame() : wordToGuess.word;

    return Text(
      text,
      style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
        color: Colors.orange[500],
        fontFamily: 'IndieFlower',
      ),
    );
  }
}
