import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_project/domain/entities/app_error.dart';
import 'package:flutter_project/domain/entities/movie_entity.dart';
import 'package:flutter_project/domain/entities/no_params.dart';
import 'package:flutter_project/domain/usecases/get_coming_soon.dart';
import 'package:flutter_project/domain/usecases/get_playng_now.dart';
import 'package:flutter_project/domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc({ 
    required this.getPopular, 
    required this.getPlayingNow, 
    required this.getComingSoon
    })
      : super(MovieTabbedInitial()) {
    on<MovieTabbedEvent>((event, emit) async {
      if (event is MovieTabChangedEvent) {
        Either<AppError, List<MovieEntity>>? moviesEither;
        switch (event.currentTabIndex) {
          case 0:
            moviesEither = await getPopular(NoParams());
            break;
          case 1:
            moviesEither = await getPlayingNow(NoParams());
            break;
          case 2:
            moviesEither = await getComingSoon(NoParams());
            break;
        }
        emit(moviesEither!.fold(
          (l) => MovieTabLoadError(currentTabIndex: event.currentTabIndex),
          (movies) {
            return MovieTabChanged(
                currentTabIndex: event.currentTabIndex, movies: movies);
          },
        ));
      }
    });
  }
}
