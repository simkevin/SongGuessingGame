import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_guessing_game/screens/home_screen.dart';
import 'package:song_guessing_game/providers/game_model.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final game = context.watch<GameModel>().game!;

    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You got ${game.correctAnswers} out of 5 correct!'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (route) => false,
                );
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}
