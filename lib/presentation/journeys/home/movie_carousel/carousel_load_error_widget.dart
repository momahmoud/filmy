import 'package:filmy/common/constants/size_constants.dart';
import 'package:filmy/common/constants/translation_constants.dart';
import 'package:filmy/common/extensions/string_extensions.dart';
import 'package:filmy/common/extensions/size_extensions.dart';
import 'package:filmy/domain/entities/app_error.dart';
import 'package:filmy/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:filmy/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class CarouselLoadErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function onPressed;

  const CarouselLoadErrorWidget({
    Key key,
    @required this.onPressed,
    @required this.errorType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.chechNetwork.t(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              Button(
                onPressed: onPressed,
                text: TranslationConstants.retry,
              ),
               Button(
                onPressed: () =>Wiredash.of(context).show(),
                text: TranslationConstants.feedback,
              ),
            ],
          )
        ],
      ),
    );
  }
}
