import 'package:filmy/common/constants/size_constants.dart';
import 'package:filmy/common/extensions/size_extensions.dart';
import 'package:filmy/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';
import '../../common/extensions/string_extensions.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Button({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.violetColor, AppColors.blueColor],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_20.w),
        )
      ),
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h),
      height: Sizes.dimen_16.h,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
