import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/common/constants/size_constants.dart';
import 'package:flutter_project/common/extensions/size_extensions.dart';
import 'package:flutter_project/common/screenutil/screenutil.dart';
import 'package:flutter_project/domain/entities/movie_entity.dart';
import 'package:flutter_project/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter_project/presentation/journeys/home/movie_carousel/animated_movie_card_widget.dart';
import 'package:flutter_project/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;

  const MoviePageView(
      {Key? key, required this.movies, required this.initialPage})
      : assert(initialPage >= 0, 'initialPage cannot be negative'),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
              index: index,
              pageController: _pageController,
              movieID: movie.id, 
              posterPath: movie.posterPath,
              );
        },
        pageSnapping: true,
        itemCount: widget.movies?.length ?? 0,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context)
          .add(MovieBackdropChangedEvent(widget.movies[index]));
        },
      ),
    );
  }
}