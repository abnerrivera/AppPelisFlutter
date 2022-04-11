import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_providers.dart';
import 'package:provider/provider.dart'; //IMPORTAMOS EL ARCHIVO DE LAS CONSULTAS

import 'package:peliculas/router/app_routers.dart';
import 'package:peliculas/themes/app_themes.dart';


void main() => runApp(const AppState()); //EJECUTAMOS NUESTRA CLASE PRINCIPAL


//stateless widget para manejo de esatados
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ //se usa este para manejar varios estados si esto es posible
        ChangeNotifierProvider(create: ( _ ) => MoviesProviders(), lazy: false,), // lazy false es para que se ejecute el metodo movies provider de una vez, y no deba esperar a ser llamado
      ],
      child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PELIAPP',
      routes: AppRoutes.getAppRoutes(), //CAPTURAMOS TODAS LAS RUTAS PARA SER USADAS
      initialRoute: AppRoutes.initialRoute,//RUTA INICIAL
      theme: AppTheme.darkTeme,//LLAMADO DE TEMAS
    );
  }
}