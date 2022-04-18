import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/screens/screens.dart';


class AppRoutes{ //CLASE GLOBAL

  //RUTA INICIAL
  static const initialRoute = 'home';


  //ARRAY CON TODAS LAS OPCIONES Y SUS RESPECTIVAS PANTALLAS
  static final menuOptions = <MenuOption>[

    //OPTION HOME
    MenuOption(route: 'home', screen: const HomeScreen()),

    //OPTION DETAILS
    MenuOption(route: 'details', screen: const DetailsScreen()),

  ]; 


  //MAPEO DE LAS OPCIONES
  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    //RUTA PRINCIPAL QUE NO SERA REPETIDA DENTRO DEL MISMO HOME
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    //CADA OPCION QUE SEA CREADA SERA RECORRIDA Y ASIGNADA COMO UNA NUEVA SEGUN EL ARRAY DE OPCIONES
    for(final option in menuOptions){
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  } 

}