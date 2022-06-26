import 'package:flutter/material.dart';
import 'package:teste_flutter/models/movie_result_model.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

MovieResult selectedMovie = MovieResult.padrao();

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
