import 'package:filmy/common/constants/languages.dart';
import 'package:filmy/common/screenUtil/screenutil.dart';
import 'package:filmy/di/get_it.dart';
import 'package:filmy/presentation/app_localization.dart';
import 'package:filmy/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:filmy/presentation/journeys/home/home_screen.dart';
import 'package:filmy/presentation/themes/app_colors.dart';
import 'package:filmy/presentation/themes/text_theme.dart';
import 'package:filmy/presentation/wiredash_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    _languageBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashApp(
              languageCode: state.locale.languageCode,
              navigatorKey: _navigatorKey,
              
              child: MaterialApp(
                navigatorKey: _navigatorKey,
                debugShowCheckedModeBanner: false,
                
                title: 'Filmy',
                theme: ThemeData(
                  unselectedWidgetColor: AppColors.violetColor,
                  primaryColor: AppColors.blackColor,
                  accentColor: AppColors.blueColor,
                  scaffoldBackgroundColor: AppColors.blackColor,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                localeResolutionCallback:
                    (Locale locale, Iterable<Locale> supportedLocales) {
                  return locale;
                },
                supportedLocales: Languages.languages
                    .map(
                      (e) => Locale(e.code),
                    )
                    .toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                home: HomeScreen(),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
