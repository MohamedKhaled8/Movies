import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:move/models/move.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
   getAllData();
  }
  String apikey = "f04342b213d1dcadca727ce7312d3baf";
  List<Movies> movieLIst = [];

  List<Movies> movieLIst2 = [];
  List<Movies> movieLIst3 = [];

  Future<void> getmovies(int pageNum) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US&page=$pageNum');
    var response = await http.get(url);
    // ignore: unused_local_variable
    var responseBody = json.decode(response.body);
    print(responseBody['results'][0]['id']);
    if (pageNum == 1) {
      for (var i in responseBody['results']) {
        movieLIst.add(Movies.fromMap(i));
      }
    }
    if (pageNum == 2) {
      for (var i in responseBody['results']) {
        movieLIst2.add(Movies.fromMap(i));
      }
    }
    if (pageNum == 3) {
      for (var i in responseBody['results']) {
        movieLIst3.add(Movies.fromMap(i));
      }
    }
    notifyListeners();
  }

  Future<String> getWatchKey (int id) async {
    
  var url = Uri.parse("https://api.themoviedb.org/3/movie/$id/videos?api_key=$apikey&language=en-US");

  var ressponse  = await http.get(url);
  var responseBody  = json.decode(ressponse.body);
  return responseBody['results'][0]['key'];
}

Future<void> getAllData() async {
  await   getmovies(1);
   await getmovies(2);
  await  getmovies(3);
  notifyListeners();
}

}



