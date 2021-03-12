import 'package:flutter/material.dart';

import 'model/word_to_guess.dart';

class LettersWidget extends StatelessWidget {
  static final ALL_LETTERS_AS_STRING = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static final List<String> letters = ALL_LETTERS_AS_STRING.split('');

  final void Function(String c) onLetterPressed;
  final WordToGuess wordToGuess;

  LettersWidget({this.wordToGuess, this.onLetterPressed}) {}

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 1,
      children: letters
          .map((c) => ElevatedButton(
                onPressed: wordToGuess.charsTried.contains(c)
                    ? null
                    : () => onLetterPressed(c),
                child: Text(c),
              ))
          .toList(),
    );
  }
}
