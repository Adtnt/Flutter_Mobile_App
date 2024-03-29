import 'package:flutter_project/data/core/api_clients.dart';
import 'package:flutter_project/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_project/data/respositories/movie_repository_impl.dart';
import 'package:flutter_project/domain/respositories/movie_repository.dart';
import 'package:flutter_project/domain/usecases/get_coming_soon.dart';
import 'package:flutter_project/domain/usecases/get_playng_now.dart';
import 'package:flutter_project/domain/usecases/get_popular.dart';
import 'package:flutter_project/domain/usecases/get_trending.dart';
import 'package:flutter_project/presentation/blocs/language/language_bloc.dart';
import 'package:flutter_project/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter_project/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:flutter_project/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async{
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(getItInstance()));

  //Phần của các Usecase
  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()));

  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  //Movie Repository
  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );

 getItInstance.registerFactory(
  () => MovieTabbedBloc(
    getPopular: GetPopular(getItInstance()),
    getPlayingNow: GetPlayingNow(getItInstance()),
    getComingSoon: GetComingSoon(getItInstance()),
  ),
  );

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}