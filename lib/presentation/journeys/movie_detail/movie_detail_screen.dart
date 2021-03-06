import 'package:filmy/common/constants/size_constants.dart';
import 'package:filmy/di/get_it.dart';
import 'package:filmy/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:filmy/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/extensions/size_extensions.dart';

import 'big_poster.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    Key key,
    @required this.movieDetailArguments,
  })  : assert(movieDetailArguments != null, 'arguments must not be null'),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailBloc _movieDetailBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _movieDetailBloc.add(
      MovieDetailLoadEvent(
        widget.movieDetailArguments.movieId,
      ),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _movieDetailBloc,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding( 
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16.w,
                      ),
                      child: Text(
                        movieDetail.overview,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
