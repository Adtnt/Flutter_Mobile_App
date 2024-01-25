import 'package:flutter/material.dart';
import 'package:flutter_project/domain/entities/movie_entity.dart';
import 'package:flutter_project/presentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:flutter_project/presentation/journeys/home/movie_carousel/movie_data_widget.dart';
import 'package:flutter_project/presentation/journeys/home/movie_carousel/movie_page_view.dart';
import 'package:flutter_project/presentation/widgets/movie_app_bar.dart';
import 'package:flutter_project/presentation/widgets/separator.dart';

class MovieCarouselWidget extends StatelessWidget {  
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    Key? key, 
    required this.movies,
    required this.defaultIndex,
  }) : assert(defaultIndex >= 0, 'default index cannot be negative'), 
  super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies: movies,
              initialPage: defaultIndex,
            ),
            // Tiêu đề phim
            MovieDataWidget(),
            // Gạch dưới tiêu đề phim
            Separator(),
          ],
        ),
      ],
    );
  }
}