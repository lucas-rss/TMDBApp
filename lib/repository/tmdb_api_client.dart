import 'dart:convert';
import 'dart:io';
import 'package:hello_world/models/Movie.dart';
import 'package:http/http.dart' as http;

class TMDBApiClient {
  final baseURL = "https://api.themoviedb.org/3";
  final http.Client httpClient;

  TMDBApiClient({this.httpClient});

  Future<List<Movie>> fetchMovies({int page}) async {
    final List<Movie> movies = [];
    final url = "$baseURL/movie/popular?api_key=$API_KEY&language=pt-BR&page=$page";
    final response = await httpClient.get(url);

    if(response.statusCode != 200){
      throw new Exception("Houve um problema!");
    }

    final decodeJson = jsonDecode(response.body);
    (decodeJson['results'] as List).forEach((element) {
      movies.add(Movie.fromJson(element));
    });

    return movies;

  }

}
