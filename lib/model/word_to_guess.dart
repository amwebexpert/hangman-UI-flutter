class WordToGuess {
  static final String STATE_NAME = 'hangman';
  final String word;

  List<String> chars;
  List<String> charsTried = [];
  int badTrialCount = 0;

  WordToGuess({this.word}) {
    this.chars = this.word.split('');
  }

  bool tryChar({String c}) {
    if (!charsTried.contains(c)) {
      charsTried.add(c);
    }

    bool ok = chars.contains(c);
    if (!ok) {
      badTrialCount++;
    }
  }

  String currentStateImage() {
    int stateNumber = badTrialCount + 1;
    String stateNumberPadded = "$stateNumber".padLeft(2, '0');
    return "$STATE_NAME-$stateNumberPadded";
  }

  String wordGame() {
    List<String> wordGame = word.split('');

    for (var i = 0; i < wordGame.length; i++) {
      String c = wordGame[i];
      if (!charsTried.contains(c)) {
        wordGame[i] = '_';
      }
    }

    return wordGame.join('');
  }
}
