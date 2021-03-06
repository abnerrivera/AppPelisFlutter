import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

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

              const _PosterAndTitle(),

              const _Overview(),
              const _Overview(),
              const _Overview(),
              const _Overview(),

              const CastigCards()

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
      elevation: 1,
      backgroundColor: const Color.fromARGB(255, 98, 98, 98),
      expandedHeight: 200,//TAMAÑO DE EL APPBAR HACIA ABAJO
      floating: false,
      pinned: true,//PERMITE QUE EL APPBAR NO SE OCULTE POR COMPLETO
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          padding: const EdgeInsets.only(bottom: 10),
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

    final TextTheme textTheme = Theme.of(context).textTheme;

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
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis, //SI EL TEXTO ES MUY LARGO CREA ...
                maxLines: 2, //SE PONDRA EN 2 LINEAS DE SER LARGO
              ),

              Text(
                'movie.originalTitle',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis, //SI EL TEXTO ES MUY LARGO CREA ...
              ),

              Row(
                children: <Widget>[
                  const Icon( Icons.star_border_outlined, size: 15, color: Colors.grey),
                  const SizedBox(width: 5,),
                  Text('movie.voteAverage', style: textTheme.caption)
                ]
              )
            ],
          ),



        ],
      ),
    );
  }
}


class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(
        'Sunt qui officia officia Lorem in nisi ex anim tempor est pariatur velit consectetur reprehenderit. Est officia deserunt voluptate tempor cillum id consequat minim cupidatat quis duis non. Ad elit ad sunt occaecat sit incididunt esse occaecat laboris eiusmod. Incididunt in Lorem cillum tempor ea cupidatat ad sit occaecat ut.',
        style: textTheme.subtitle1,
        textAlign: TextAlign.justify,
        )
    );
  }
}

