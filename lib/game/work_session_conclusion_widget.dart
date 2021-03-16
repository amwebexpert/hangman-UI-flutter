import 'package:flutter/material.dart';
import 'package:hangman/game/work_session_text_widget.dart';

import '../model/word_to_guess.dart';

class WordSessionConclusion extends StatelessWidget {
  final TextToGuess textToGuess;

  WordSessionConclusion({this.textToGuess}) {}

  @override
  Widget build(BuildContext context) {
    String gameOverImage = "assets/images/${textToGuess.gameOverImage()}.png";
    MaterialColor color =
        textToGuess.isGameOverWithSuccess() ? Colors.green : Colors.red;

    return Column(
      children: [
        SizedBox(
          width: 140,
          child: Image.asset(
            gameOverImage,
            color: color,
          ),
        ),
        WordSessionText(textToGuess: textToGuess, isHiddenMode: false),
      ],
    );
  }
}
