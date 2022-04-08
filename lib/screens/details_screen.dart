import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {


    //PARA CAPTURAR Y LEER ARGUMENTOS
    final String movie = ModalRoute.of(context)?.settings.arguments.toString()??'NO-MOVIE';



    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const _CustomAppBar(),

          SliverList(
            delegate:SliverChildListDelegate([
              const _PosterAndTitle()
            ])
          )
           
        ],
      ),
    );
  }
}






//CUSTOM APPBAR DIFERENTE COMPORTAMINETO CON EL SLIDER
class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red,
      expandedHeight: 200,//TAMAÑO DE EL APPBAR HACIA ABAJO
      floating: false,
      pinned: true,//PERMITE QUE EL APPBAR NO SE OCULTE POR COMPLETO
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12, 
          child: const Text(
            'MOVIE.TITLE',
            style: TextStyle(
              fontSize: 15,
            ),
            )
          ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
        
      ),


    );
  }
}



class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( top:20),
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            )
          ),

          const SizedBox(width:20),

          Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: <Widget>[

              Text(
                'movie.title',
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis, //SI EL TEXTO ES MUY LARGO CREA ...
                maxLines: 2, //SE PONDRA EN 2 LINEAS DE SER LARGO
              ),

              Text(
                'movie.originalTitle',
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis, //SI EL TEXTO ES MUY LARGO CREA ...
              ),
            ],
          ),



        ],
      ),
    );
  }
}