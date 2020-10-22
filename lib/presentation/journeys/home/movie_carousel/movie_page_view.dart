import 'package:filmy/common/constants/size_constants.dart';
import 'package:filmy/common/screenUtil/screenutil.dart';
import 'package:filmy/domain/entities/movie_entity.dart';
import 'package:filmy/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:filmy/presentation/journeys/home/movie_carousel/animated_movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/extensions/size_extensions.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView({
    Key key,
    @required this.initialPage,
    @required this.movies,
  })  : assert(initialPage >= 0, 'initialPage cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: .7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.screenHeight * 0.35,
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
            index: index,
            pageController: _pageController,
            posterPath: movie.posterPath,
            movieId: movie.id,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies?.length ?? 0,
        onPageChanged: (index){
          BlocProvider.of<MovieBackdropBloc>(context).add(MovieBackdropChangedEvent(widget.movies[index]));
        },
      ),
    );
  }
}
