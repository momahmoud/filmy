import 'package:dartz/dartz.dart';
import 'package:filmy/data/data_source/movie_data_source.dart';
import 'package:filmy/data/models/movie_model.dart';
import 'package:filmy/domain/entities/app_error.dart';
import 'package:filmy/domain/entities/movie_entity.dart';

import 'package:filmy/domain/repositories/movie_repository.dart';

class MovieRepositoryImplement extends MovieRepository {
  final MovieDataSource movieDataSource;
  MovieRepositoryImplement(this.movieDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await movieDataSource.getTrending();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await movieDataSource.getComingSoon();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await movieDataSource.getPlayingNow();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await movieDataSource.getPopular();
      return Right(movies);
    } on Exception {
      return Left(AppError('Something went wrong'));
    }
  }
}
