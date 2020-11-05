import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:filmy/data/data_source/movie_data_source.dart';
import 'package:filmy/data/models/movie_detail_model.dart';
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
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await movieDataSource.getComingSoon();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await movieDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await movieDataSource.getPopular();
      return Right(movies);
    }on SocketException {
      return Left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async{
    try {
      final movie = await movieDataSource.getMovieDetail(id);
      return Right(movie);
    }on SocketException {
      return Left(AppError(AppErrorType.network));
    }on Exception{
      return Left(AppError(AppErrorType.api));
    }
  }
}
