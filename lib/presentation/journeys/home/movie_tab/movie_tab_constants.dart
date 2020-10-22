import 'package:filmy/common/constants/translation_constants.dart';
import 'package:filmy/presentation/journeys/home/movie_tab/tab.dart';

class MovieTabConstants {
  static const List<Tab> movieTabs = const [
    const Tab(index: 0, title: TranslationConstants.now),
    const Tab(index: 1, title: TranslationConstants.soon),
    const Tab(index: 2, title: TranslationConstants.popular),
  ];
}