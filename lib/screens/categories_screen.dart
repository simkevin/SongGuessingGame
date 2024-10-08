import 'package:flutter/material.dart';
import 'package:song_guessing_game/screens/game_screen.dart';
import 'package:song_guessing_game/models/song.dart';
import 'package:song_guessing_game/services/spotify_service.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Category')),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Pop', textAlign: TextAlign.center),
              onTap: () async {
                // Fetch songs from Spotify based on pop genre
                final artistId = '0TnOYISbd1XYRBk9myaseg';
                final artistName = await SpotifyService.getArtist(artistId);

                if (artistName != null) {
                  print('Artist Name: $artistName');
                } else {
                  print('Error retrieving artist information.');
                }

                /*List<Song> popSongs = []; // Replace with actual data fetching
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(songs: popSongs),
                  ),
                );*/
              },
            ),
            ListTile(
              title: const Text('EDM', textAlign: TextAlign.center),
              onTap: () {
                // Fetch songs from Spotify based on pop genre
                //List<Song> popSongs = ...; // Replace with actual data fetching
                //Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(songs: popSongs)));
              },
            ),
            ListTile(
              title: const Text('Rap', textAlign: TextAlign.center),
              onTap: () {
                // Fetch songs from Spotify based on pop genre
                //List<Song> popSongs = ...; // Replace with actual data fetching
                //Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(songs: popSongs)));
              },
            ),
            ListTile(
              title: const Text('Jazz', textAlign: TextAlign.center),
              onTap: () {
                // Fetch songs from Spotify based on pop genre
                //List<Song> popSongs = ...; // Replace with actual data fetching
                //Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(songs: popSongs)));
              },
            ),
            // Add more categories here
          ],
        ),
      ),
    );
  }
}
