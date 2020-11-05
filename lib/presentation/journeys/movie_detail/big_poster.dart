import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmy/common/constants/size_constants.dart';
import 'package:filmy/common/screenUtil/screenutil.dart';
import 'package:filmy/data/core/api_constants.dart';
import 'package:filmy/domain/entities/movie_detail_entity.dart';
import 'package:flutter/material.dart';
import '../../themes/text_theme.dart';
import '../../../common/extensions/num_extensions.dart';
import '../../../common/extensions/size_extensions.dart';
import 'movie_detail_app_bar.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;

  const BigPoster({
    Key key,
    @required this.movie,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor.withOpacity(.3),
            Theme.of(context).primaryColor,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            width: ScreenUtil.screenWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            subtitle: Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.greySubtitle1,
            ),
            trailing: Text(
              movie.voteAverage.convertToPercentageString(),
              style: Theme.of(context).textTheme.violetHeadline6,
            ),
          ),
        ),
        Positioned(
          right: Sizes.dimen_16.w,
          left: Sizes.dimen_16.w,
          top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          child: MovieDetailAppBar(),
        )
      ],
    );
  }
}
