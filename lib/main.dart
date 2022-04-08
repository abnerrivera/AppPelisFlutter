import 'package:flutter/material.dart';
import 'package:peliculas/router/app_routers.dart';
import 'package:peliculas/themes/app_themes.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PELIAPP',
      routes: AppRoutes.getAppRoutes(), //CAPTURAMOS TODAS LAS RUTAS PARA SER USADAS
      initialRoute: AppRoutes.initialRoute,//RUTA INICIAL
      theme: AppTheme.lightTeme,//LLAMADO DE TEMAS
    );
  }
}