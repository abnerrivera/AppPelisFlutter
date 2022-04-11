// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

import '../models/models.dart';

class MovieSlider extends StatelessWidget {

  //PROPIEDADES PARA LLAMAR EL API O PARA MODIFICAR FACILMENTE EL WIDGET
  final List<Movie>movies; //basicamente traigo la data en lista
  final String? title;

  

  const MovieSlider({Key? key, required this.movies, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 290,
      child: Column(
        children: <Widget>[

          if (title != null)
          //TITULO POPULARES
            Padding(
              padding: const EdgeInsets.symmetric( horizontal: 20),
              child: Text(title!, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              
            ),

          
          const SizedBox(height: 10,),

          Expanded( //TOMA EL ESPACIO DISPONILE COMPLETO
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length, //los items mapeados son los mismos que vienen en el array
              itemBuilder: (_, int index) => _MoviePoster(movies[index]) //mapea por cada index su info
            ),
          ),

        ],
      ),
    );
  }
}




class _MoviePoster extends StatelessWidget {

  final Movie movie;
  const _MoviePoster ( this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height:300,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal:10),
      child: Column(
        children: <Widget>[

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments:'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                fit: BoxFit.cover
              ),
            ),
          ),

          const SizedBox(height: 5,),

          Expanded(
            child: Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )

        ],
      ),
    );
  }
}