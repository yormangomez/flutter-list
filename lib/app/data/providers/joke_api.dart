import 'dart:io';

import 'package:dio/dio.dart';

class JokeAPI {
  JokeAPI._internal();
  static JokeAPI _instance = JokeAPI._internal();
  static JokeAPI get instance => _instance;

  final _dio = Dio();

  Future<String> getJoke() async {
    try {
      _dio.options.headers['Accept'] = 'application/json';
      final Response response =
          await this._dio.get('https://icanhazdadjoke.com');

      if (response.statusCode == 200) {
        final jokeData = response.data['joke'];

        return jokeData;
      } else {
        return Future.error('Ocurrio un error al obtener la respuesta');
      }
    } on SocketException {
      return Future.error(
          'Se perdió la conexión con el servidor, por favor verifique su conexión a internet');
    } on Exception {
      return Future.error(
          'Ocurrio un error al obtener la respuesta del servidor');
    }
  }
}
