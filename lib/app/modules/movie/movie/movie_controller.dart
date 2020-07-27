import 'package:mobx/mobx.dart';
import 'package:movie_flutter/app/modules/movie/core/model/movie.dart';
import 'package:movie_flutter/app/modules/movie/repositories/interfaces/movie_repository_interface.dart';

part 'movie_controller.g.dart';

class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  final IMovieRepository movieRepository;

  @observable
  Movie movie;

  @observable
  bool loading = true;

  _MovieControllerBase(this.movieRepository);

  @action
  findById(String id) async {
    movie = await movieRepository.findById(id);
    loading = false;
  }
}
