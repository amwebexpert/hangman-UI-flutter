import 'package:flutter/material.dart';
import 'package:hangman/work_session_text_widget.dart';

import 'model/word_to_guess.dart';

class WordSessionConclusion extends StatelessWidget {
  final WordToGuess wordToGuess;

  WordSessionConclusion({this.wordToGuess}) {}

  @override
  Widget build(BuildContext context) {
    String gameOverImage = "assets/images/${wordToGuess.gameOverImage()}.png";
    MaterialColor color =
        wordToGuess.isGameOverWithSuccess() ? Colors.green : Colors.red;

    return Column(
      children: [
        SizedBox(
          width: 140,
          child: Image.asset(
            gameOverImage,
            color: color,
          ),
        ),
        WordSessionText(wordToGuess: wordToGuess, isHiddenMode: false),
      ],
    );
  }
}
