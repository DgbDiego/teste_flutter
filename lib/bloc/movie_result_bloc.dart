import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_flutter/models/movie_result_model.dart';
import 'package:teste_flutter/services/filmes_lists_service.dart';

class MovieResultBloc extends Bloc {
  MovieResultBloc(initialState) : super(initialState);

  Future<List<MovieResult>> getListEmExibicao() async {
    List<MovieResult> tempMovies = [];
    tempMovies = await FilmesListsService().getNowPlaying();
    return tempMovies;
  }
  Future<List<MovieResult>> getListPopular() async {
    List<MovieResult> tempMovies = [];
    tempMovies = await FilmesListsService().getPopular();
    return tempMovies;
  }

}