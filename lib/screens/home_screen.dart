import 'package:flutter/material.dart';
import 'package:peliculas/providers/providers.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProviders>(context);
    //print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        actions:<Widget>[

          IconButton(icon: const Icon(Icons.search_outlined), onPressed: (){},) //BUSCADOR

        ],
        title: const Text('Peliculas en Cine'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
      
      
            //CARD SLIDER
            CardSwipe(movies: moviesProvider.onDisplayMovies),
      
      
            //CARD SLIDER HORIZONTAL
             MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Popular!',
            )
            
          ],
        ),
      )
    );
  }
}