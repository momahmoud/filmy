import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmy/common/constants/size_constants.dart';
import 'package:filmy/data/core/api_constants.dart';
import 'package:flutter/material.dart';
import '../../../../common/extensions/size_extensions.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  const MovieCardWidget({
    Key key,
    @required this.posterPath,
    @required this.movieId,
  }): super(key : key);

  @override
  Widget build(BuildContext context) {
    return Material(
      
       borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      elevation: 32,
          child: GestureDetector(
        onTap: (){},
            child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
              child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}