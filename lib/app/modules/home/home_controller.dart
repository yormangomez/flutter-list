import 'package:app_prueba/app/data/models/jokes_model.dart';
import 'package:app_prueba/app/data/repositories/joke_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final repository = new JokeRepository();
  RxList<JokeModel> jokes = <JokeModel>[].obs;

  void getJoke() async {
    final ramdonJoke = await repository.getJoke();
    jokes.add(JokeModel(joke: ramdonJoke, likes: 0));
  }

  void like(int index) {
    var jokeSelected = jokes[index];

    jokeSelected.likes++;
    update();
  }

  void dislike(int index) {
    var jokeSelected = jokes[index];

    jokeSelected.likes--;
    update();
  }
}
