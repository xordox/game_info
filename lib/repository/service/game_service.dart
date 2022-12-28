import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:game_info/repository/models/game.dart';
import 'package:game_info/repository/models/genre.dart';
import 'package:game_info/repository/models/result.dart';
import 'package:game_info/repository/models/result_error.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class GameService {
  final String baseUrl;
  final Client _httpClient;

  GameService({
    http.Client? httpClient,
    this.baseUrl = 'https://api.rawg.io/api',
  }): _httpClient = httpClient ?? http.Client();

  Uri getUrl({
    required String url,
    Map<String, String>? extraParameters,
  }) {
    final queryParameters = <String, String> {
      'key': dotenv.get('GAMES_API_KEY')
    };

    if(extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$baseUrl/$url').replace(
      queryParameters: queryParameters,
    );
  }

  Future<Game> getGames() async {
    final response = await _httpClient.get(getUrl(url: 'games'),);

    if(response.statusCode == 200){
      if(response.body.isNotEmpty) {
        return Game.fromJson(json.decode(response.body));
      }else{
        throw ErrorEmptyResponse();
      }
    }else{
      throw ErrorGettingGames('Error getting games');
    }
  }

  Future<List<Genre>> getGenres() async {
    final response = await _httpClient.get(getUrl(url: 'genres'),);

    if(response.statusCode == 200){
      if(response.body.isNotEmpty){
        return List<Genre>.from(
          json.decode(response.body)['results'].map(
            (data) => Genre.fromJson(data),
          ),
        );
      }else{
        throw ErrorEmptyResponse();
      }
    }else{
      throw ErrorGettingGames('Error getting genres');
    }
  }

  Future <List<Result>> getGamesByCategory(int genreId) async {
    final response = await _httpClient.get(getUrl(url: 'genres',
    extraParameters: {
      'genres': genreId.toString(),
    }),);

    if(response.statusCode ==200) {
      if(response.body.isNotEmpty){
        return List<Result>.from(
          json.decode(response.body)['results'].map(
            (data) => Result.fromJson(data),
          ),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingGames('Error getting games');
    }
  }
}