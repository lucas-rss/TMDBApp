
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  PageController bottomController = PageController(
    initialPage: 0,
    viewportFraction: .2,
  );
  
 @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(#4d4d4d),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is MovieFailed) {
              return Center(
                child: Text('Houve um problema...'),
              );
            }

            if (state is MovieSuccess) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text('Sem Filmes'),
                );
              }

              return _buildMovies(state);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
