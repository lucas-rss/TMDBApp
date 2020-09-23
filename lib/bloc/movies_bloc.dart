import 'package:equatable/equatable.dart';

//EVENTO

abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchMovies extends MovieEvent{}
