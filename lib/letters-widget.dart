import 'package:flutter/material.dart';

class LettersWidget extends StatelessWidget {
  static final ALL_LETTERS_AS_STRING = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static final List<String> letters = ALL_LETTERS_AS_STRING.split('');
  final void Function(String c) onLetterPressed;

  LettersWidget({this.onLetterPressed}) {
    print('constructor of LettersWidget');
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      spacing: 1,
      children: letters
          .map(
            (c) => ElevatedButton(
                child: Text(c),
                onPressed: () {
                  onLetterPressed(c);
                }),
          )
          .toList(),
    );
  }
}
