import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class CardSwipe extends StatelessWidget {


  //PROPIEDADES PARA LLAMAR EL API O PARA MODIFICAR FACILMENTE EL WIDGET
  final List<Movie>movies;
  





  const CardSwipe({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; //CAPTURAMOS LOS TAMAÑOS DEL CONTEXTO DEL APP
    if(movies.isEmpty){
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator()
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5, //0.5 = 50% DEL ESPACIO DISPONIBLE (DE ESTA MANERA OCUPAMOS TAMAÑOS SEGUN EL DISPOSITIVO)
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,//"ESTILO ANIMACION"
        itemWidth: size.width * 0.6, 
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int index){

          final movie = movies[index];//recorre cada movie por index uno a uno
          

          return GestureDetector( //ES UN GESTO QUE EJECUTA ALGO (CLICK)
            onTap: () => Navigator.pushNamed(context, 'details', arguments:'movie-instance'), //NAVEGACION AL DAR CLICK
            child: ClipRRect( //LO AGREGAMOS PARA PODER DAR BORDES
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movie.fullPosterImg), 
                  fit: BoxFit.cover, //SE ADAPTAN LOS TAMAÑOS
              ),
            ),
          );
        

        },

      ),
    );
  }
}