import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('assets/images/uol-logo-full-light.png', width: 60,),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: MediaQuery.of(context).size.width/2,
              // color: Colors.green,
              child: Expanded(
                child: ListView.builder(
                  itemCount: elemento.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (context, index){
                      return Card(
                        child: SizedBox(

                          child: Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face/boIgXXUhw5O3oVkhXsE6SJZkmYo.jpg'),
                          // child: Image.asset(elemento[index].toString()),
                        ),
                      );
                    }
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
