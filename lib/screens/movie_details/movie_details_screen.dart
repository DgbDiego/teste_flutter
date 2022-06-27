import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_flutter/bloc/movie_detail_bloc.dart';
import 'package:teste_flutter/models/movie_detail_model.dart';
import 'package:teste_flutter/models/movie_result_model.dart';
import 'package:teste_flutter/util/const.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    Key? key,
    required this.idMovie
  }) : super(key: key);

  final int idMovie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  MovieDetail selectedMovie = MovieDetail.padrao();
  late final MovieDetailBloc movieDetailBloc;

  @override
  void initState(){
    super.initState();
    movieDetailBloc = MovieDetailBloc();
    movieDetailBloc.add(LoadMovieDetailEvent(id: widget.idMovie));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        bloc: movieDetailBloc,
        builder: (context, state){
          if (state is MovieDetailInitialState) {
            return const Center(child: CircularProgressIndicator(),);
          } else if (state is MovieDetailSuccessState){
            selectedMovie = state.movie;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: false,
                  backgroundColor: Colors.transparent,

                  expandedHeight: MediaQuery.of(context).size.width/1.7,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(selectedMovie.title),
                    background: Image.network(
                        BASE_IMG_URL + selectedMovie.backdrop_path,fit: BoxFit.fitHeight,
                    ),


                  ),


                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }


}
