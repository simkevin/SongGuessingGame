import 'package:song_guessing_game/utils/constants.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class SpotifyService {
  static Future<String?> getAccessToken() async {
    // Authorization headers
    // Request access token/send authorization request
    final clientId = Constants.spotifyClientID;
    final clientSecret = Constants.spotifyClientSecret;

    final credentials = base64Encode(utf8.encode('$clientId:$clientSecret'));
    final authorizationHeader = 'Basic $credentials';

    final url = Uri.parse('https://accounts.spotify.com/api/token');
    final body = {
      'grant_type': 'client_credentials',
    };

    try {
      final response = await http.post(url,
          headers: {'Authorization': authorizationHeader}, body: body);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['access_token'];
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }

  static Future<String?> getArtist(String artistId) async {
    // Base URL for the Spotify Web API
    final baseUrl = 'https://api.spotify.com/v1/artists/$artistId';

    // Get access token
    final token = await getAccessToken();
    final authorizationHeader = 'Bearer $token';

    // Request body
    final Map<String, String> headers = {
      'Authorization': authorizationHeader,
      'Accept': 'application/json',
    };

    try {
      final response = await http.get(Uri.parse(baseUrl), headers: headers);

      if (response.statusCode == 200) {
        // Parse the JSON response
        final data = jsonDecode(response.body);
        return data['name']; // Extract the artist name (example)
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }
}
