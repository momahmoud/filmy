import 'package:filmy/data/core/api_client.dart';
import 'package:filmy/data/data_source/movie_data_source.dart';
import 'package:filmy/data/repositories/movie_repository_implement.dart';
import 'package:filmy/domain/repositories/movie_repository.dart';
import 'package:filmy/domain/useCase/get_coming_soon.dart';
import 'package:filmy/domain/useCase/get_movie_detail.dart';
import 'package:filmy/domain/useCase/get_playing_now.dart';
import 'package:filmy/domain/useCase/get_popular.dart';
import 'package:filmy/domain/useCase/get_trending.dart';
import 'package:filmy/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:filmy/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:filmy/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:filmy/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:filmy/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieDataSource>(
      () => MovieDataSourceImplement(getItInstance()));
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImplement(getItInstance()));
  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      movieBackdropBloc: getItInstance(),
      getTrending: getItInstance(),
    ),
  );

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(() => MovieTabbedBloc(
        getComingSoon: getItInstance(),
        getPlayingNow: getItInstance(),
        getPopular: getItInstance(),
      ));

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());

  getItInstance
      .registerFactory(() => MovieDetailBloc(getMovieDetail: getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));
}
