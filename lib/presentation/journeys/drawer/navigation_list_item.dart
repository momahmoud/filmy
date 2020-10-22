import 'package:filmy/common/constants/size_constants.dart';
import 'package:flutter/material.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../app_localization.dart';
class NavigationListItem extends StatelessWidget {
  final String title;
  final Function onTap;

  const NavigationListItem({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
         decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      ),
    );
  }
}



class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function onTap;

  const NavigationSubListItem({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
         decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
        title: Text(
          AppLocalizations.of(context).translate(title),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      ),
    );
  }
}
