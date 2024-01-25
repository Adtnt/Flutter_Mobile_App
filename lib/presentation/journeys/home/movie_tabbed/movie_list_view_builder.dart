import 'package:flutter/material.dart';
import 'package:flutter_project/common/extensions/size_extensions.dart';
import 'package:flutter_project/domain/entities/movie_entity.dart';
import 'package:flutter_project/presentation/journeys/home/movie_tabbed/movie_tab_card_widget.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity> movies;

  const MovieListViewBuilder({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 20.w,
            );
          },
          itemBuilder: (context, index) {
            final MovieEntity movie = movies[index];
            return MovieTabCardWidget(
              movieId: movie.id,
              title: movie.title,
              posterPath: movie.posterPath,
            );
          },
        ));
  }
}
