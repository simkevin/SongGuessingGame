import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';
import 'package:song_guessing_game/providers/game_model.dart';
import 'package:song_guessing_game/models/game.dart';
import 'package:song_guessing_game/models/song.dart';

class GameScreen extends StatefulWidget {
  final List<Song> songs;

  const GameScreen({Key? key, required this.songs}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late AudioPlayer _audioPlayer;
  int _timeLeft = 10; // Adjust timer duration as needed
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    context.read<GameModel>().startGame(widget.songs);
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer?.cancel();
          // Handle time's up logic
          context.read<GameModel>().nextQuestion();
          startTimer();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameModel>().game!;
    const options = [
      "Option 1",
      "Option 2",
      "Option 3",
      "Option 4",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Guess the Song')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Time Left: $_timeLeft'),
            Text(game.songs[game.currentSongIndex].artist),
            ElevatedButton(
              onPressed: () async {
                await _audioPlayer
                    .play(UrlSource(game.songs[game.currentSongIndex].uri));
              },
              child: const Text('Play Song'),
            ),
            Column(
              children: [
                for (int i = 0; i < 4; i++)
                  ElevatedButton(
                    onPressed: () {
                      //context.read<GameModel>().checkAnswer(options[i]);
                      // Handle correct/incorrect answer feedback
                    },
                    //child: Text(options[i]), // Replace with actual options
                    child: Text(options[i]),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
