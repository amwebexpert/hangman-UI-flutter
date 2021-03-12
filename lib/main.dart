import 'package:flutter/material.dart';
import 'package:hangman/letters-widget.dart';
import 'package:hangman/model/word_to_guess.dart';
import 'package:hangman/work_session_conclusion.dart';
import 'package:hangman/work_session_text.dart';

void main() => runApp(HangmanApp());

class HangmanApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(title: 'Hangman'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WordToGuess wordToGuess = WordToGuess(word: 'AMOUR');

  void reset() {
    setState(() {
      wordToGuess = WordToGuess(word: 'AMOUR');
    });
  }

  void tryLetter(String c) {
    setState(() {
      wordToGuess.tryChar(c: c);
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentStateImg =
        "assets/images/${wordToGuess.currentStateImage()}.png";

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.orange[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WordSessionText(wordToGuess: wordToGuess, isHiddenMode: true),
            Expanded(child: Image.asset(currentStateImg)),
            wordToGuess.isGameOver()
                ? WordSessionConclusion(wordToGuess: wordToGuess)
                : LettersWidget(
                    wordToGuess: wordToGuess, onLetterPressed: tryLetter),
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
