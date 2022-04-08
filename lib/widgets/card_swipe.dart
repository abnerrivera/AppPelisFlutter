import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwipe extends StatelessWidget {
  const CardSwipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size; //CAPTURAMOS LOS TAMAÑOS DEL CONTEXTO DEL APP


    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5, //0.5 = 50% DEL ESPACIO DISPONIBLE (DE ESTA MANERA OCUPAMOS TAMAÑOS SEGUN EL DISPOSITIVO)
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,//"ESTILO ANIMACION"
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (BuildContext context, int index){

          return GestureDetector( //ES UN GESTO QUE EJECUTA ALGO (CLICK)
            onTap: () => Navigator.pushNamed(context, 'details', arguments:'movie-instance'), //NAVEGACION AL DAR CLICK
            child: ClipRRect( //LO AGREGAMOS PARA PODER DAR BORDES
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover, //SE ADAPTAN LOS TAMAÑOS
              ),
            ),
          );
        

        },

      ),
    );
  }
}