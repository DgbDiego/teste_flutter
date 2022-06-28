import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_flutter/bloc/movie_result_bloc.dart';
import 'package:teste_flutter/screens/movie_details/movie_details_screen.dart';
import 'package:teste_flutter/util/const.dart';

class CarouselMovies{


  Widget carouselMovies({
    required BuildContext context,
    required String carouselTitle,
    required carouselBloc,
  }){

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(carouselTitle,style: const TextStyle(fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width/2,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    child: BlocBuilder<MovieResultBloc, MovieState>(
                        bloc: carouselBloc,
                        builder: (context, state) {
                          if(state is MovieInitialState){
                            return const Center(child: CircularProgressIndicator(),);
                          } else if (state is MovieSuccessState) {
                            final movieList = state.movies;
                            return ListView.builder(
                                itemCount: movieList.length,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      debugPrint('Filme: ${movieList[index].title} - Id: ${movieList[index].id}');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MovieDetailsScreen(idMovie: movieList[index].id))
                                      );
                                    },
                                    child: Card(
                                      color: Colors.transparent,
                                      elevation: 3,
                                      child: SizedBox(
                                        child: Image.network(
                                            BASE_IMG_URL + movieList[index].poster_path
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            );
                          }
                          return const Center(child: CircularProgressIndicator(),);
                        }
                    )
                )
              ],
            ),
          ),
        ],
      );
    }
}