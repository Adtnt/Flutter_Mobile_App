import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/domain/entities/movie_entity.dart';
import 'package:flutter_project/domain/entities/no_params.dart';
import 'package:flutter_project/domain/usecases/get_trending.dart';
import 'package:flutter_project/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc,
  }) : super(MovieCarouselInitial()) {
    on<CarouselLoadEvent>((event, emit) async {
      // Sử dụng 'on' thay vì 'on<MovieCarouselEvent>'
      try {
        final moviesEither = await getTrending(NoParams());
        emit(moviesEither.fold((l) => MovieCarouselError(), (movies) {
          movieBackdropBloc.add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
          return MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          );
        }));
      } catch (error) {
        // Xử lý bất kỳ lỗi nào xảy ra trong quá trình thực hiện
        emit(MovieCarouselError());
      }
    });
  }
}
