class TextToGuess {
  static final String STATE_NAME = 'hangman';
  static final int MAX_TRIALS = 10;
  final String word;

  List<String> chars;
  List<String> charsTried = [];
  int badTrialCount = 0;

  TextToGuess({this.word}) {
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
    if (stateNumber > MAX_TRIALS) {
      stateNumber = MAX_TRIALS;
    }

    String stateNumberPadded = "$stateNumber".padLeft(2, '0');
    return "$STATE_NAME-$stateNumberPadded";
  }

  String gameOverImage() {
    return isGameOverWithSuccess() ? 'success' : 'fail';
  }

  bool isGameOver() {
    return isGameOverWithFailure() || isGameOverWithSuccess();
  }

  bool isGameOverWithFailure() {
    return badTrialCount >= MAX_TRIALS - 1;
  }

  bool isGameOverWithSuccess() {
    return !wordGame().contains('_');
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
