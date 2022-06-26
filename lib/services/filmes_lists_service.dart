import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teste_flutter/models/movie_result_model.dart';
import 'package:teste_flutter/util/const.dart';

class FilmesListsService{
  Dio? dio;

  FilmesListsService(){
    dio = Dio();
    dio!.options.baseUrl = BASE_URL + 'movie/';
    dio!.options.receiveTimeout = 30000;
  }

  Future<dynamic> getNowPlaying() async {
    Response response = await dio!.get('now_playing?api_key=${const_apiKey}&language=pt-BR&page=1').catchError((e){
      print(e);
    });

    if (response.data != null && response.data.toString().isNotEmpty){
      List<MovieResult> movieResults = [];
      (response.data['results'] as List).forEach((movie) {
        movieResults.add(MovieResult.fromJson(movie));
      });
      print('~~');
      return movieResults;
    } else {
      return null;
    }
  }

  Future<dynamic> getPopular() async {
    Response response = await dio!.get('popular?api_key=${const_apiKey}&language=pt-BR&page=1').catchError((e){
      print(e);
    });

    if (response.data != null && response.data.toString().isNotEmpty){
      List<MovieResult> movieResults = [];
      (response.data['results'] as List).forEach((movie) {
        movieResults.add(MovieResult.fromJson(movie));
      });

      return movieResults;
    } else {
      return null;
    }
  }

  Future<dynamic> getSingleMovie(int movieId) async {
    Response response = await dio!.get('${movieId}?api_key=${const_apiKey}&language=pt-BR').catchError((e){
      print(e);
    });

    if (response.data != null && response.data.toString().isNotEmpty){
      List<MovieResult> movieResults = [];
      (response.data['results'] as List).forEach((movie) {
        movieResults.add(MovieResult.fromJson(movie));
      });
      return movieResults;
    } else {
      return null;
    }
  }






}