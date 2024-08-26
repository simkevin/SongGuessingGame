import 'package:flutter/material.dart';
import 'package:song_guessing_game/screens/categories_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Song Guessing Game')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CategoriesScreen()));
          },
          child: const Text('Start Game'),
        ),
      ),
    );
  }
}
