import 'package:filmy/common/constants/languages.dart';
import 'package:filmy/common/constants/size_constants.dart';
import 'package:filmy/common/constants/translation_constants.dart';
import 'package:filmy/presentation/app_localization.dart';
import 'package:filmy/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:filmy/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:filmy/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:filmy/presentation/themes/app_colors.dart';
import 'package:filmy/presentation/widgets/app_dialog.dart';
import 'package:filmy/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiredash/wiredash.dart';
import '../../../common/extensions/size_extensions.dart';
import '../../../common/extensions/string_extensions.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(.7),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.h,
                bottom: Sizes.dimen_18.h,
                right: Sizes.dimen_8.w,
                left: Sizes.dimen_8.w,
              ),
              child: Logo(
                height: Sizes.dimen_20.h,
              ),
            ),
            NavigationListItem(
              title: TranslationConstants.favoriteMovies.t(context),
              onTap: () {},
            ),
            NavigationListItem(
              title: TranslationConstants.feedback.t(context),
              onTap: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: TranslationConstants.about.t(context),
              onTap: () {
                Navigator.of(context).pop();
                _showDialog(context);
              },
            ),
            NavigationExpandedListTile(
              title: AppLocalizations.of(context)
                  .translate(TranslationConstants.language),
              onTap: (index) {
                BlocProvider.of<LanguageBloc>(context).add(ToggleLanguageEvent(
                  Languages.languages[index],
                ));
              },
              children: Languages.languages.map((e) => e.value).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      child: AppDialog(
        title: TranslationConstants.about,
        description: TranslationConstants.aboutDescription,
        buttonText: TranslationConstants.ok,
        image: Image.asset(
          'assets/pngs/tmdb_logo.png',
          height: Sizes.dimen_32.h,
        ),
      ),
    );
  }
}
