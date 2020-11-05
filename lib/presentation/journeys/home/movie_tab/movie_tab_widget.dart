import 'package:filmy/common/constants/size_constants.dart';
import 'package:filmy/common/extensions/string_extensions.dart';
import 'package:filmy/common/constants/translation_constants.dart';
import 'package:filmy/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:filmy/presentation/journeys/home/movie_carousel/carousel_load_error_widget.dart';
import 'package:filmy/presentation/journeys/home/movie_tab/movie_tab_constants.dart';
import 'package:filmy/presentation/journeys/home/movie_tab/tab_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/extensions/size_extensions.dart';
import 'movie_listview_builder.dart';

class MovieTabWidget extends StatefulWidget {
  @override
  _MovieTabWidgetState createState() => _MovieTabWidgetState();
}

class _MovieTabWidgetState extends State<MovieTabWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedBloc =>
      BlocProvider.of<MovieTabbedBloc>(context);
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < MovieTabConstants.movieTabs.length; i++)
                    TabTitleWidget(
                      title: MovieTabConstants.movieTabs[i].title,
                      onTap: () => _onTab(i),
                      isSelected: MovieTabConstants.movieTabs[i].index ==
                          state.currentTabIndex,
                    ),
                ],
              ),
              if (state is MovieTabChanged)
                state.movies?.isEmpty ?? true
                    ? Expanded(
                        child: Center(
                          child: Text(
                            TranslationConstants.noMovies.t(context),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      )
                    : Expanded(
                        child: MovieListviewBuilder(movies: state.movies),
                      ),
              if (state is MovieTabLoadError)
                Expanded(
                  child: CarouselLoadErrorWidget(
                    onPressed: () => movieTabbedBloc.add(
                      MovieTabChangedEvent(
                        currentTabIndex: state.currentTabIndex,
                      ),
                    ),
                    errorType: state.errorType,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onTab(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
