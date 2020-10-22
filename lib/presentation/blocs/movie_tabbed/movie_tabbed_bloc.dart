import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmy/domain/entities/app_error.dart';
import 'package:filmy/domain/entities/movie_entity.dart';
import 'package:filmy/domain/entities/no_params.dart';
import 'package:filmy/domain/useCase/get_coming_soon.dart';
import 'package:filmy/domain/useCase/get_playing_now.dart';
import 'package:filmy/domain/useCase/get_popular.dart';
import 'package:flutter/foundation.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetComingSoon getComingSoon;
  final GetPlayingNow getPlayingNow;

  MovieTabbedBloc({
     @required this.getComingSoon,
     @required this.getPlayingNow,
     @required this.getPopular,
  }) : super(MovieTabbedInitial());

  @override
  Stream<MovieTabbedState> mapEventToState(
    MovieTabbedEvent event,
  ) async* {
    if (event is MovieTabChangedEvent) {
      Either<AppError, List<MovieEntity>> moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 1:
          moviesEither = await getComingSoon(NoParams());
          break;
        case 2:
          moviesEither = await getPopular(NoParams());
          break;
      }
      yield moviesEither.fold(
        (l) => MovieTabLoadError(currentTabIndex: event.currentTabIndex),
        (movies){
          return MovieTabChanged(
            currentTabIndex: event.currentTabIndex,
            movies: movies, 
          );
        },
      );
    }
  }
}
