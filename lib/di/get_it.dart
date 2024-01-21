import 'package:flutter_project/data/core/api_clients.dart';
import 'package:flutter_project/data/data_sources/movie_remote_data_source.dart';
import 'package:flutter_project/data/respositories/movie_repository_impl.dart';
import 'package:flutter_project/domain/respositories/movie_repository.dart';
import 'package:flutter_project/domain/usecases/get_coming_soon.dart';
import 'package:flutter_project/domain/usecases/get_playng_now.dart';
import 'package:flutter_project/domain/usecases/get_popular.dart';
import 'package:flutter_project/domain/usecases/get_trending.dart';
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
}