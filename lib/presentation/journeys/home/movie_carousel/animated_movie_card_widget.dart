import 'package:flutter/material.dart';
import 'package:flutter_project/common/constants/size_constants.dart';
import 'package:flutter_project/common/extensions/size_extensions.dart';
import 'package:flutter_project/common/screenutil/screenutil.dart';
import 'package:flutter_project/presentation/journeys/home/movie_carousel/movie_card_widget.dart';

class AnimatedMovieCardWidget extends StatelessWidget {
  final int index;
  final int? movieID;
  final String? posterPath;
  final PageController pageController;

  const AnimatedMovieCardWidget(
      {Key? key,
      required this.index,
      required this.movieID,
      required this.posterPath,
      required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index; //** */
          value = (1 - (value.abs() * 0.1)).clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Curves.easeIn.transform(value) *
                  ScreenUtil.screenHeight *
                  0.35,
              width: Sizes.dimen_230.w,
              child: child,
            ),
          );
        } else {
          return Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: Curves.easeIn.transform(value) *
                    ScreenUtil.screenHeight *
                    0.35,
                width: Sizes.dimen_230.w,
                child: child,
              ));
        }
      },
      child: MovieCardWidget(
        moviedId: movieID,
        posterPath: posterPath,
      ),
    );
  }
}
