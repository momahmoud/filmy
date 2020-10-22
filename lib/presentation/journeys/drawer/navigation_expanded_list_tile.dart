import 'package:filmy/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:flutter/material.dart';

class NavigationExpandedListTile extends StatelessWidget {
  final String title;
  final Function onTap;
  final List<String> children;

  const NavigationExpandedListTile({
    Key key,
    @required this.title,
    @required this.onTap,
    @required this.children,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(.7),
            blurRadius: 2,
          ),
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        children: [
          for (int i = 0; i < children.length; i++)
            NavigationSubListItem(
              title: children[i],
              onTap:  () { onTap(i);},
            ),
        ],
      ),
    );
  }
}
