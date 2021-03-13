import 'package:flutter/material.dart';

import '../model/word_to_guess.dart';

class LetterWidget extends StatelessWidget {
  final void Function(String c) onLetterPressed;
  final WordToGuess wordToGuess;
  final String letter;

  LetterWidget({this.letter, this.wordToGuess, this.onLetterPressed}) {}

  @override
  Widget build(BuildContext context) {
    bool letterConsumed = wordToGuess.charsTried.contains(letter);

    return ElevatedButton(
      onPressed: letterConsumed ? null : () => onLetterPressed(letter),
      child: Text(
        letter,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontFamily: 'IndieFlower',
        ),
      ),
    );
  }
}
