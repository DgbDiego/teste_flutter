
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_flutter/bloc/movie_result_bloc.dart';
import 'package:teste_flutter/models/movie_result_model.dart';
import 'package:teste_flutter/services/filmes_lists_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  late final MovieResultBloc movies_exibicao_bloc;
  late final MovieResultBloc movies_popular_bloc;
  List<MovieResult> list_emExibicao = [];
  List<MovieResult> list_populares = [];

  // Future <dynamic> loadListEmExibicao(context) async {
  //   await MovieResultBloc(context).getListEmExibicao().then((result) {
  //     list_emExibicao = result;
  //   });
  // }
  // Future <dynamic> loadListPopulares(context) async {
  //   await MovieResultBloc(context).getListPopular().then((result){
  //     list_populares = result;
  //   });
  // }

  @override
  void initState(){
    super.initState();
    movies_exibicao_bloc = MovieResultBloc();
    movies_exibicao_bloc.add(LoadNowPlayingEvent());
    movies_popular_bloc = MovieResultBloc();
    movies_popular_bloc.add(LoadNowPlayingEvent());
  }

  @override
  void dispose(){
    movies_exibicao_bloc.close();
    movies_popular_bloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/uol-logo-full-light.png', width: 60,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Em exibição",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Container(
                height: MediaQuery.of(context).size.width/2,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        child: BlocBuilder<MovieResultBloc, MovieState>(
                          bloc: movies_exibicao_bloc,
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
                                    return Card(
                                      elevation: 3,
                                      child: SizedBox(
                                        child: Image.network(
                                            'https://www.themoviedb.org/t/p/w342/${movieList[index]
                                                .poster_path}'),
                                        // child: Image.asset(elemento[index].toString()),
                                      ),
                                    );
                                  }
                              );
                            }
                            return Container();
                          }
                        )
                    )
                  ],
                ),
              ),

              const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Mais Populares",style: TextStyle(fontWeight: FontWeight.bold),),
              ),

              Container(
                height: MediaQuery.of(context).size.width/2,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        child: BlocBuilder<MovieResultBloc, MovieState>(
                            bloc: movies_popular_bloc,
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
                                      return Card(
                                        elevation: 3,
                                        child: SizedBox(
                                          child: Image.network(
                                              'https://www.themoviedb.org/t/p/w342/${movieList[index]
                                                  .poster_path}'),
                                          // child: Image.asset(elemento[index].toString()),
                                        ),
                                      );
                                    }
                                );
                              }
                              return Container();
                            }
                        )
                    )
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
