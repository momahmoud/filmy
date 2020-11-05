import 'package:filmy/data/core/api_client.dart';
import 'package:filmy/data/models/movie_detail_model.dart';

import 'package:filmy/data/models/movie_model.dart';
import 'package:filmy/data/models/movies_result.dart';

abstract class MovieDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<MovieDetailModel> getMovieDetail(int id);
}

class MovieDataSourceImplement extends MovieDataSource {
  final ApiClient _client;

  MovieDataSourceImplement(
    this._client,
  );
  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResult.fromJson(response).movies;

    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResult.fromJson(response).movies;

    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResult.fromJson(response).movies;

    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResult.fromJson(response).movies;

    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    
    return movie;
  }
}
