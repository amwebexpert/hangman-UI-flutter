class WordToGuess {
  String word;
  List<String> chars;
  List<String> charsTried = [];

  WordToGuess({this.word}) {
    this.chars = this.word.split('');
  }

  bool tryChar({String c}) {
    if (!charsTried.contains(c)) {
      charsTried.add(c);
    }

    return chars.contains(c);
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
