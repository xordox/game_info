import 'package:game_info/repository/models/model_barrel.dart';
import 'package:game_info/repository/service/game_service.dart';

class GameRepository {
  final GameService service;

  GameRepository({required this.service});

  Future<Game> getGames() async => service.getGames();

  Future<List<Genre>> getGenres() async => service.getGenres();

  Future<List<Result>> getGamesByCategory(int genreId) async =>
      service.getGamesByCategory(genreId);
}
