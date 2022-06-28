import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_flutter/models/movie_detail_model.dart';
import 'package:teste_flutter/services/filmes_lists_service.dart';

abstract class MovieDetailState{
  MovieDetail movie;
  MovieDetailState({
    required this.movie
  });
}

class MovieDetailInitialState extends MovieDetailState{
  MovieDetailInitialState() : super(movie: MovieDetail.padrao());
}

class MovieDetailSuccessState extends MovieDetailState{
  MovieDetailSuccessState({required MovieDetail movie}) : super(movie: movie);
}

class MovieDetailErrorState extends MovieDetailState{
  MovieDetailErrorState() : super(movie: MovieDetail.padrao());
}

abstract class MovieDetailEvent{}

class LoadMovieDetailEvent extends MovieDetailEvent{
  int id;
  LoadMovieDetailEvent({
    required this.id,
});
}

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState>{

  final _movieDetailService = FilmesListsService();

  MovieDetailBloc() : super(MovieDetailInitialState()){
    on<LoadMovieDetailEvent>(
        (event, emit) async {
          var movie = await _movieDetailService.getSingleMovie(event.id);
          emit(MovieDetailSuccessState(movie: movie));
        }
    );
  }
}