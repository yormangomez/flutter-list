import 'package:app_prueba/app/data/providers/joke_api.dart';

class JokeRepository {
  final jokeApiProvider = JokeAPI.instance;

  Future<String> getJoke() async => await jokeApiProvider.getJoke();
}