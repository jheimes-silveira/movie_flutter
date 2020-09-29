import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:js_ui_components/js_ui_components.dart';
import 'package:movie_flutter/app/modules/movie/core/model/movie.dart';
import 'package:movie_flutter/app/modules/movie/repositories/dio_client.dart';

import 'interfaces/movie_repository_interface.dart';

part 'movie_repository.g.dart';

@Injectable()
class MovieRepository implements IMovieRepository {
  final DioForNative client = DioClient.getInstance();

  @override
  void dispose() {}

  @override
  Future<Paginator<Movie>> find(Paginator<Movie> paginator, String type) async {
    String path = '?apikey=d12b4be8';

    path += '&s=${paginator.term}';

    path += '&type=$type';

    path += '&page=${paginator.currentPage}';

    Response response = await client.get(path);

    final data = (response.data['Search'] as List)
        .map((e) => Movie.fromJson(e))
        .toList();

    final page = _parsePaginator(
      paginator.currentPage,
      int.parse(response.data['totalResults']),
    );

    return Paginator<Movie>.fromJson(
      page,
      data,
    );
  }

  @override
  Future<Movie> findById(String id) async {
    String path = '?apikey=d12b4be8&i=$id';

    Response response = await client.get(path);

    return Movie.fromJson(response.data);
  }

  Map<String, dynamic> _parsePaginator(
    int currentPage,
    int totalResults,
  ) {
    Map<String, dynamic> json = Map();

    json['per_page'] = 10;
    json['current_page'] = currentPage;
    json['total'] = totalResults;

    return json;
  }
}
