import 'package:filmy/domain/entities/movie_entity.dart';
import 'package:filmy/presentation/journeys/home/movie_carousel/movie_data_widget.dart';
import 'package:filmy/presentation/widgets/movie_app_bar.dart';
import 'package:filmy/presentation/widgets/separator.dart';
import 'package:flutter/material.dart';

import 'movie_backdrop_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    Key key,
    @required this.defaultIndex,
    @required this.movies,
  })  : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            MovieDataWidget(),
            Separator(),
          ],
        )
      ],
    );
  }
}
