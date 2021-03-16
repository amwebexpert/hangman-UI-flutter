import 'package:flutter/material.dart';
import 'package:hangman/game/letters-widget.dart';
import 'package:hangman/game/work_session_conclusion_widget.dart';
import 'package:hangman/game/work_session_text_widget.dart';
import 'package:hangman/model/word_to_guess.dart';
import 'package:hangman/services/hangman_service.dart';

class GameWidget extends StatefulWidget {
  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final HangmanService service = HangmanService.INSTANCE;
  TextToGuess textToGuess;
  Map data = {};

  @override
  void initState() {
    super.initState();

    String newText = service.shuffle().normalized;
    textToGuess = TextToGuess(characters: newText);
  }

  void reset() {
    String newText = service.shuffle().normalized;
    setState(() => textToGuess = TextToGuess(characters: newText));
  }

  void tryLetter(String c) {
    setState(() => textToGuess.tryChar(c: c));
  }

  void appBarMenuItemClick(String value) async {
    switch (value) {
      case 'Categories':
        dynamic result = await Navigator.pushNamed(context, '/categories');
        print('new category: ${result['name']}');
        this.reset();
        break;
      case 'A propos...':
        Navigator.pushNamed(context, '/about');
        break;
    }
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
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: appBarMenuItemClick,
            itemBuilder: (BuildContext context) {
              return {'Categories', 'A propos...'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: reset,
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
