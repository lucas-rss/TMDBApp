import 'package:hello_world/repository/tmdb_api_client.dart';
import 'package:hello_world/models/Movie.dart';

class TMDBRepository{
  final TMDBApiClient tmdbApiClient;
  TMDBRepository({this.tmdbApiClient});

  Future<List<Movie>> fetchMovies({int page}) async {
    return await tmdbApiClient.fetchMovies(page: page);
  }
  
  Future<MovieDetails> fetchMovieDetails({int id}) async {
    return await tmdbApiClient.fetchMovieDetails(id: id);
  }

}
