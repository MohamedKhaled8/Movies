import 'dart:convert';

class Movies {
  int id;
  String title;
  String overview;
  String poster_path;
  double vote_average;
  Movies({
    required this.id,
    required this.title,
    required this.overview,
    required this.poster_path,
    required this.vote_average,
  });

 
   

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': poster_path,
      'vote_average': vote_average,
    };
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      id: map['id']?.toInt(),
      title: map['title'],
      overview: map['overview'],
      poster_path: map['poster_path'],
      vote_average: map['vote_average']?.toDouble(),
    );
  }

} 