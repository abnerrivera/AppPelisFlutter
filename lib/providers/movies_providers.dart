
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/models/now_playing_response.dart';

class MoviesProviders extends ChangeNotifier{ //usamos el privider para la gestion de estados

  final String _apiKey = '7ea42a741ae2b0bcc8d1429fe4ff05bd';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';
  final String _page = '1';
  final String _complemento = '/3/movie/now_playing';

  List<Movie> onDisplayMovies = []; //array vacio "estado inicial"
  List<Movie> popularMovies = []; //array vacio ""


  MoviesProviders(){

    getPopularMovies();
    getOnDisplayMovies(); //aca estoy llamado al metodo de abajo al construtor

  }






  //=========================================================================================================================
  getOnDisplayMovies() async{ //espera una respuesta para seguir

    var url =
      Uri.https(_baseUrl, _complemento, {
          'api_key': _apiKey,
          'languages': _language,
          'page': _page,
        }
      );

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners(); //avisa que hubo un cambio en la data y este los hace redibujar a los que tuvieron un cambio
    

    //if (response.statusCode != 200) return print('error'); //una manera de manejar el error

  }


  //=========================================================================================================================
  getPopularMovies() async{

    var url =
      Uri.https(_baseUrl, '3/movie/popular', {
          'api_key': _apiKey,
          'languages': _language,
          'page': _page,
        }
      );

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies,...popularResponse.results];
    print(popularMovies[0]);

    notifyListeners();

  }

}