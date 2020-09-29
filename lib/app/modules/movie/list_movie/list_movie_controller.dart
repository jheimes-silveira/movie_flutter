import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:js_ui_components/js_ui_components.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_flutter/app/modules/movie/core/model/movie.dart';
import 'package:movie_flutter/app/modules/movie/repositories/interfaces/movie_repository_interface.dart';

part 'list_movie_controller.g.dart';

@Injectable()
class ListMovieController = _ListMovieControllerBase with _$ListMovieController;

abstract class _ListMovieControllerBase with Store {
  final IMovieRepository movieRepository;
  TextEditingController inputController;

  @observable
  bool loading = false;

  @observable
  bool inResearch = false;

  @observable
  String query;

  @observable
  String type = Movie.typeMovie;

  @observable
  Paginator<Movie> paginator;

  _ListMovieControllerBase(this.movieRepository) {
    query = 'Rambo';
    inputController = TextEditingController(text: query);
  }

  goToMovie(String imdbID) {
    Modular.link.pushNamed('/$imdbID');
  }

  @action
  find() async {
    if (this.paginator == null) {
      this.paginator = Paginator(
        currentPage: 1,
        perPage: 10,
      );
    }

    if (this.paginator.data.isEmpty) {
      loading = true;
    }

    this.paginator.term = query;
    Paginator<Movie> paginator;

    try {
      paginator = await movieRepository.find(this.paginator, type);
    } catch (e) {
      paginator = Paginator(
        currentPage: 1,
        perPage: 10,
      );
    } finally {
      this.paginator.merge(paginator);
      loading = false;
      this.paginator = this.paginator;
    }
  }

  @action
  setTypeMovie(String type) {
    this.type = type;
  }

  @action
  setInResearch(bool inResearch) {
    this.inResearch = inResearch;
  }

  @action
  setQuery(String query) {
    this.query = query;
  }
}
