import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_flutter/app/modules/movie/list_movie/list_movie_page.dart';
import 'package:movie_flutter/app/modules/movie/repositories/dio_client.dart';

import 'list_movie/list_movie_controller.dart';
import 'movie/movie_controller.dart';
import 'movie/movie_page.dart';
import 'repositories/interfaces/movie_repository_interface.dart';
import 'repositories/movie_repository.dart';

class MovieModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IMovieRepository>(
          (i) => MovieRepository(
            DioClient.getInstance(),
          ),
        ),
        Bind(
          (i) => MovieController(
            i.get<IMovieRepository>(),
          ),
        ),
        Bind(
          (i) => ListMovieController(
            i.get<IMovieRepository>(),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ListMoviePage()),
        Router('/:id', child: (_, args) => MoviePage(args.params['id'])),
      ];

  static Inject get to => Inject<MovieModule>.of();
}
