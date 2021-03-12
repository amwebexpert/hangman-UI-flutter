import 'package:flutter/material.dart';
import 'package:hangman/letters-widget.dart';
import 'package:hangman/model/word_to_guess.dart';

void main() => runApp(HangmanApp());

class HangmanApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman App',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
    print("_HomePageState.build called");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${wordToGuess.wordGame()}',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.green[500],
                fontFamily: 'IndieFlower',
              ),
            ),
            Expanded(child: Image.asset('assets/images/hangman-10.png')),
            LettersWidget(wordToGuess: wordToGuess, onLetterPressed: tryLetter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => reset(),
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
