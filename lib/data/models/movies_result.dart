import 'package:filmy/data/models/movie_model.dart';

class MoviesResult {
  
  List<MovieModel> movies;
 


  MoviesResult({ this.movies,});

  MoviesResult.fromJson(Map<String, dynamic> json) {
    
    if (json['results'] != null) {
      movies = new List<MovieModel>();
      json['results'].forEach((v) {
        movies.add(new MovieModel.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.movies != null) {
      data['results'] = this.movies.map((v) => v.toJson()).toList();
    }
 
    return data;
  }
}

