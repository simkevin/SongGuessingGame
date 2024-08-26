import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_guessing_game/models/song.dart';
import 'package:song_guessing_game/models/game.dart';

class GameModel extends ChangeNotifier {
  Game? _game;

  Game? get game => _game;

  void startGame(List<Song> songs) {
    _game = Game(songs: songs);
    notifyListeners();
  }

  void nextQuestion() {
    _game!.currentSongIndex++;
    notifyListeners();
  }

  void checkAnswer(String answer) {
    if (answer == _game!.songs[_game!.currentSongIndex].name) {
      _game!.correctAnswers++;
    }
    notifyListeners();
  }
}
