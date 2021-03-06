import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/bloc/movies_bloc.dart';
import 'package:hello_world/repository/tmdb_api_client.dart';
import 'package:hello_world/repository/tmdb_repository.dart';
import 'package:http/http.dart' as http;
import 'package:hello_world/views/home_page.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class MyApp extends StatelessWidget {
  TMDBRepository tmdbRepository = TMDBRepository(
    tmdbApiClient: TMDBApiClient(
      httpClient: http.Client(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => MovieBloc(tmdbRepository: tmdbRepository)
          ..add(
            FetchMovies(),
          ),
        child: HomePage(),
      ),
    );
  }
}
