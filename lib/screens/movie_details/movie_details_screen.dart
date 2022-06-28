import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_flutter/bloc/movie_detail_bloc.dart';
import 'package:teste_flutter/models/genre_model.dart';
import 'package:teste_flutter/models/movie_detail_model.dart';
import 'package:teste_flutter/models/movie_result_model.dart';
import 'package:teste_flutter/screens/movie_details/widgets/vote_average_bar.dart';
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

  String concatGenre(List<Genre>? genres) {
    List<String> temp = [];
    genres!.forEach((element) {
      temp.add(element.name);
    });
    String result = temp.join(' - ');
    return result;
  }

  @override
  void initState(){
    super.initState();
    movieDetailBloc = MovieDetailBloc();
    movieDetailBloc.add(LoadMovieDetailEvent(id: widget.idMovie));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
      ),
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        bloc: movieDetailBloc,
        builder: (context, state){
          if (state is MovieDetailInitialState) {
            return const Center(child: CircularProgressIndicator(),);
          } else if (state is MovieDetailSuccessState){
            selectedMovie = state.movie;
            return Stack(
              children: [

                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Imagem BackDrop
                    SizedBox(
                      height: MediaQuery.of(context).size.width/1.4,
                      child: Image.network(
                        BASE_IMG_URL + selectedMovie.backdrop_path,fit: BoxFit.fitHeight,
                      ),
                    ),
                   ///Titulo
                    SizedBox(
                     height: MediaQuery.of(context).size.width/3.6,
                     child: Padding(
                         padding: EdgeInsets.all(10),
                       child: Row(
                         mainAxisSize: MainAxisSize.max,
                         mainAxisAlignment: MainAxisAlignment.end,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Flexible(
                             flex:3,
                             child: Text(
                               selectedMovie.title,
                               style: TextStyle(fontSize: 24),
                               softWrap: true,

                             ),
                           ),
                           Flexible(
                             flex: 2,
                             child: SizedBox(),
                           )
                         ],
                       ),
                     ),
                   ),
                    ///Sinopse
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedMovie.overview,
                            softWrap: true,
                            style: TextStyle(

                            ),
                          )
                        ],
                      ),
                    ),
                    ///Genero
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Gênero:'),
                          Text(
                            concatGenre(selectedMovie.genres),
                            softWrap: true,
                            style: TextStyle(
                              color: Colors.white54

                            ),
                          )
                        ],
                      ),
                    ),
                    ///Avaliacao
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text('Avaliação dos usuários:'),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              VoteAverageBar().voteAverage(voteAvg: selectedMovie.vote_average)
                            ],
                          ),


                        ],
                      ),
                    )





                  ],
                ),
                Positioned(
                  left: 20,
                  top: MediaQuery.of(context).size.width/1.8,
                  child: Card(
                    color: Colors.transparent,
                    elevation: 5,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width/2.5,
                      child: Image.network(
                        BASE_IMG_URL + selectedMovie.poster_path,fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),

              ],
            );
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
