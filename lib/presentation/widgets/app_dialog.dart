import 'package:filmy/common/constants/translation_constants.dart';
import 'package:filmy/common/extensions/size_extensions.dart';
import 'package:filmy/common/extensions/string_extensions.dart';
import 'package:filmy/common/constants/size_constants.dart';
import 'package:filmy/presentation/themes/app_colors.dart';
import 'package:filmy/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget image;

  const AppDialog({
    Key key,
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.blackColor,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_8.w))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title.t(context),
            style: Theme.of(context).textTheme.headline5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
            child: Text(
              description.t(context),
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ),
          if (image != null) image,
          Button(
            onPressed: () {
              Navigator.of(context).pop();
            },
            text: TranslationConstants.ok,
          ),
        ],
      ),
    );
  }
}
