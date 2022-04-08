import 'package:flutter/material.dart';

class CastigCards extends StatelessWidget {
  const CastigCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const _CastCard();
        },
      ),
    );
  }
}




class _CastCard extends StatelessWidget {
  const _CastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: 100,
      height: 100,
      child: Column(
        children: <Widget>[


          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/150x300'),
                height: 140,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 5,),

          const Text(
            'actor.name sadasdasdasdas',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )



        ]
      )
    );
  }
}