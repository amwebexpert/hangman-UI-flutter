import 'package:flutter/material.dart';
import 'package:hangman/game/letters-widget.dart';
import 'package:hangman/game/work_session_conclusion_widget.dart';
import 'package:hangman/game/work_session_text_widget.dart';
import 'package:hangman/model/word_to_guess.dart';

class GameWidget extends StatefulWidget {
  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  TextToGuess textToGuess = TextToGuess(word: 'AMOUR');
  Map data = {};

  void reset() {
    setState(() => textToGuess = TextToGuess(word: 'AMOUR'));

    // Navigate to About page...
    Navigator.pushNamed(context, '/about');
  }

  void tryLetter(String c) {
    setState(() => textToGuess.tryChar(c: c));
  }

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    print(data['categories']);

    String currentStateImg =
        "assets/images/${textToGuess.currentStateImage()}.png";

    return Scaffold(
      appBar: AppBar(
        title: Text('Le pendu numérique'),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WordSessionText(textToGuess: textToGuess, isHiddenMode: true),
            Expanded(child: Image.asset(currentStateImg)),
            textToGuess.isGameOver()
                ? WordSessionConclusion(textToGuess: textToGuess)
                : LettersWidget(
                    textToGuess: textToGuess, onLetterPressed: tryLetter),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
