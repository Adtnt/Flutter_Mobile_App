import 'package:flutter_project/common/constants/translation_constants.dart';
import 'package:flutter_project/presentation/journeys/home/movie_tabbed/tab.dart';

class MovieTabbedConstants  {
  // Tao tab 
  static const List<Tab> movieTabs = const [
    const Tab(index: 0, title: TranslationConstants.popular),
    const Tab(index: 1, title: TranslationConstants.now),
    const Tab(index: 2, title: TranslationConstants.soon),
  ];
}