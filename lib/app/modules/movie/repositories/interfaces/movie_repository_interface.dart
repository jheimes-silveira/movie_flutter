import 'package:flutter_modular/flutter_modular.dart';
import 'package:js_ui_components/js_ui_components.dart';
import 'package:movie_flutter/app/modules/movie/core/model/movie.dart';

abstract class IMovieRepository implements Disposable {
  Future<Paginator<Movie>> find(
    Paginator<Movie> paginator,
    String type,
  );

  Future<Movie> findById(String id);
}
