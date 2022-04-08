// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      child: Column(
        children: <Widget>[

          //TITULO POPULARES
          const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20),
            child: Text('Populares', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            
          ),
          
          const SizedBox(height: 10,),

          Expanded( //TOMA EL ESPACIO DISPONILE COMPLETO
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {

                return const _MoviePoster();

              },
            ),
          ),

        ],
      ),
    );
  }
}




class _MoviePoster extends StatelessWidget {
  const _MoviePoster({
    Key? key,
  }) : super(key: key);

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
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                fit: BoxFit.cover
              ),
            ),
          ),


          const Text(
            'La mejor pelicula del año con una historia alucinante y con el mejor reparto de hollywood',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )

        ],
      ),
    );
  }
}