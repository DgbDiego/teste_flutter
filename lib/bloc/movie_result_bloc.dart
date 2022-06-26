import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teste_flutter/models/movie_result_model.dart';
import 'package:teste_flutter/services/filmes_lists_service.dart';



abstract class MovieState{
  List<MovieResult> movies;
  MovieState({
    required this.movies,
  });
}

class MovieInitialState extends MovieState{
  MovieInitialState() : super(movies: []);
}

class MovieSuccessState extends MovieState{
  MovieSuccessState({required List<MovieResult> movies}) : super(movies: movies);
}

class MovieErrorState extends MovieState{
  MovieErrorState() : super(movies: []);
}

abstract class MovieEvent{}

class LoadNowPlayingEvent extends MovieEvent{}
class LoadPopularEvent extends MovieEvent{}

class LoadingMovieEvent extends MovieEvent{}
class LoadSingleMovieEvent extends MovieEvent{
  int movieId;
  LoadSingleMovieEvent({
    required this.movieId
});
}

class AddMovieEvent extends MovieEvent{
  MovieResult movie;
  AddMovieEvent({
   required this.movie,
  });
}
class RemoveMovieEvent extends MovieEvent{
  MovieResult movie;
  RemoveMovieEvent({
   required this.movie,
  });
}

class MovieResultBloc extends Bloc<MovieEvent, MovieState>{

  final _movieService = FilmesListsService();

  // final StreamController<MovieEvent> _inputMovieController = StreamController<MovieEvent>();
  // final StreamController<MovieState> _outputMovieController = StreamController<MovieState>();
  //
  // Sink<MovieEvent> get inputMovie => _inputMovieController.sink;
  // Stream<MovieState> get stream => _outputMovieController.stream;

  MovieResultBloc() : super(MovieInitialState()){
    on<LoadNowPlayingEvent>(
        (event, emit) async {
          var movies = await _movieService.getNowPlaying();
          emit(MovieSuccessState(movies: movies));
        }
    );
    on<LoadPopularEvent>(
        (event, emit) async {
          var movies = await _movieService.getPopular();
          emit(MovieSuccessState(movies: movies));
        }
    );
    on<LoadSingleMovieEvent>(
        (event, emit) async {
          var movies = await _movieService.getSingleMovie(event.movieId);
          emit(MovieSuccessState(movies: movies));
        }
    );

  }


}