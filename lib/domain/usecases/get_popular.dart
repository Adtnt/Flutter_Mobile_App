import 'package:dartz/dartz.dart';
import 'package:flutter_project/domain/entities/app_error.dart';
import 'package:flutter_project/domain/entities/movie_entity.dart';
import 'package:flutter_project/domain/entities/no_params.dart';
import 'package:flutter_project/domain/respositories/movie_repository.dart';
import 'package:flutter_project/domain/usecases/usecase.dart';

class GetPopular extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetPopular(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getPopular();
  }
}