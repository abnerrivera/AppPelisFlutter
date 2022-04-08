import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:<Widget>[

          IconButton(icon: const Icon(Icons.search_outlined), onPressed: (){},) //BUSCADOR

        ],
        title: const Text('Peliculas en Cine'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
      
      
            //CARD SLIDER
            CardSwipe(),
      
      
            //CARD SLIDER HORIZONTAL
            MovieSlider()
            
          ],
        ),
      )
    );
  }
}