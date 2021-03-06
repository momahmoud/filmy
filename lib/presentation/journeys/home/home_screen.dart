import 'package:filmy/di/get_it.dart';
import 'package:filmy/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:filmy/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:filmy/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:filmy/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:filmy/presentation/journeys/home/movie_carousel/carousel_load_error_widget.dart';
import 'package:filmy/presentation/journeys/home/movie_tab/movie_tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_carousel/movie_carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  MovieTabbedBloc movieTabbedBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getItInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    movieTabbedBloc = getItInstance<MovieTabbedBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieBackdropBloc?.close();
    movieCarouselBloc?.close();
    movieTabbedBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (context) => movieBackdropBloc,
        ),
         BlocProvider(
          create: (context) => movieTabbedBloc,
        ),
      ],
      child: Scaffold(
        drawer: NavigationDrawer(),
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          bloc: movieCarouselBloc,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: .6,
                      child: MovieCarouselWidget(
                        movies: state.movies,
                        defaultIndex: state.defaultIndex,
                      )),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: .4,
                    child: MovieTabWidget()
                  )
                ],
              );
            }else if(state is MovieCarouselError){
              return CarouselLoadErrorWidget(
                onPressed: () => movieCarouselBloc.add(CarouselLoadEvent()),
                errorType: state.errorType,
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
