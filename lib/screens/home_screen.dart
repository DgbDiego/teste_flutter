

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:teste_flutter/bloc/movie_result_bloc.dart';
import 'package:teste_flutter/models/movie_result_model.dart';
import 'package:teste_flutter/services/filmes_lists_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();


}

  List<String> elemento = [
    'assets/images/banner_teste.jpg',
    'assets/images/banner_teste.jpg',
    'assets/images/banner_teste.jpg',
    'assets/images/banner_teste.jpg',
    'assets/images/banner_teste.jpg'
  ];

List<MovieResult> list_emExibicao = [];
List<MovieResult> list_populares = [];

Future <dynamic> loadListEmExibicao(context) async {
  await MovieResultBloc(context).getListEmExibicao().then((result) {
    list_emExibicao = result;
  });
}
Future <dynamic> loadListPopulares(context) async {
  await MovieResultBloc(context).getListPopular().then((result){
    list_populares = result;
  });
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    loadListEmExibicao(context);
    loadListPopulares(context);

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

              FutureBuilder(
                future: loadListEmExibicao(context),
                builder: (context,snapshot){
                  if (snapshot.connectionState == ConnectionState.done){
                    return Container(
                      height: MediaQuery.of(context).size.width/2,
                      // color: Colors.green,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: list_emExibicao.length,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index){
                                  return Card(
                                    elevation: 3,
                                    child: SizedBox(
                                      child: Image.network('https://www.themoviedb.org/t/p/w342/${list_emExibicao[index].poster_path}'),
                                      // child: Image.asset(elemento[index].toString()),
                                    ),
                                  );
                                }
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },

              ),
              const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Mais Populares",style: TextStyle(fontWeight: FontWeight.bold),),
              ),

              FutureBuilder(
                future: loadListPopulares(context),
                builder: (context,snapshot){
                  if (snapshot.connectionState == ConnectionState.done){
                    return Container(
                      height: MediaQuery.of(context).size.width/2,
                      // color: Colors.green,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemCount: list_populares.length,
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index){
                                  return Card(
                                    elevation: 3,
                                    child: SizedBox(
                                      child: Image.network('https://www.themoviedb.org/t/p/w342/${list_populares[index].poster_path}'),
                                      // child: Image.asset(elemento[index].toString()),
                                    ),
                                  );
                                }
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
