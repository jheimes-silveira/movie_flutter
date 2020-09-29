import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_flutter/app/modules/movie/list_movie/list_movie_page.dart';

import 'list_movie/list_movie_controller.dart';
import 'movie/movie_controller.dart';
import 'movie/movie_page.dart';
import 'repositories/movie_repository.dart';

class MovieModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $MovieRepository,
        $MovieController,
        $ListMovieController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ListMoviePage()),
        ModularRouter('/:id', child: (_, args) => MoviePage(args.params['id'])),
      ];

  static Inject get to => Inject<MovieModule>.of();
}
