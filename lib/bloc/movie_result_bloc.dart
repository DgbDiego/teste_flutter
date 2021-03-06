import 'package:flutter_bloc/flutter_bloc.dart';
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
  }

}