import 'package:equatable/equatable.dart';

//EVENTO

abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMovies extends MovieEvent{}

//ESTADOS

abstract class MovieState extends Equatable{
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState{}
class MovieFailed extends MovieState{}
class MovieSuccess extends MovieState{
  final List<Movie> movies;
  final bool hasReachedMax;

  MovieSuccess({

    this.movies,
    this.hasReachedMax  
  });
}
