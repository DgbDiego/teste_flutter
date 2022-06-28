import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:teste_flutter/bloc/movie_result_bloc.dart';
import 'package:teste_flutter/screens/home/widgets/carousel_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MovieResultBloc moviesExibicaoBloc;
  late final MovieResultBloc moviesPopularBloc;

  @override
  void initState(){
    super.initState();
    moviesExibicaoBloc = MovieResultBloc();
    moviesExibicaoBloc.add(LoadNowPlayingEvent());
    moviesPopularBloc = MovieResultBloc();
    moviesPopularBloc.add(LoadPopularEvent());
  }

  @override
  void dispose(){
    moviesExibicaoBloc.close();
    moviesPopularBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00000000),
        elevation: 0,
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
              CarouselMovies().carouselMovies(
                  context: context,
                  carouselTitle: 'Em exibição',
                  carouselBloc: moviesExibicaoBloc
              ),
              CarouselMovies().carouselMovies(
                  context: context,
                  carouselTitle: 'Mais Populares',
                  carouselBloc: moviesPopularBloc
              ),
            ],
          ),
        ),
      ),
    );
  }
}
