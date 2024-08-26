import "package:song_guessing_game/models/song.dart";

class Game {
  List<Song> songs;
  int currentSongIndex;
  int correctAnswers;

  Game({
    required this.songs,
    this.currentSongIndex = 0,
    this.correctAnswers = 0,
  });
}
