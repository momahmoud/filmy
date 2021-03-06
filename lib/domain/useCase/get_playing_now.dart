import 'package:dartz/dartz.dart';
import 'package:filmy/domain/entities/app_error.dart';
import 'package:filmy/domain/entities/movie_entity.dart';
import 'package:filmy/domain/entities/no_params.dart';
import 'package:filmy/domain/repositories/movie_repository.dart';
import 'package:filmy/domain/useCase/use_case.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;
  GetPlayingNow(this.repository);

@override
  Future<Either<AppError,List<MovieEntity>>> call(NoParams noParams) async{
    return await repository.getPlayingNow();
  }
}