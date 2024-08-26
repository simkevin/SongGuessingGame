import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:song_guessing_game/screens/home_screen.dart';
import 'package:song_guessing_game/providers/game_model.dart'; // Import your GameModel

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Song Guessing Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
