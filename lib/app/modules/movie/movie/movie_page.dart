import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:js_ui_components/js_ui_components.dart';

import 'movie_controller.dart';

class MoviePage extends StatefulWidget {
  final String id;

  const MoviePage(this.id);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends ModularState<MoviePage, MovieController> {
  @override
  void initState() {
    super.initState();

    controller.findById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          if (controller?.movie?.title == null) {
            return Container();
          }

          return Text(controller.movie.title);
        }),
      ),
      body: Observer(
        builder: (_) {
          if (controller.loading) {
            return JsProgress();
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        JsNetworkImage(
                          imageUrl: controller.movie.poster,
                          circular: false,
                          height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 3,
                          errorWidget: Icon(
                            Icons.image,
                            color: Colors.white.withOpacity(0.5),
                            size: 50,
                          ),
                        ),
                        Observer(
                          builder: (_) {
                            return Expanded(
                              child: ListTile(
                                title: Text(
                                  controller.movie.title,
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Released: ${controller.movie.released}',
                                    ),
                                    Text(
                                      'Runtime: ${controller.movie.runtime}',
                                    ),
                                    Text(
                                      'Genre: ${controller.movie.genre}',
                                    ),
                                    Text(
                                      'Director: ${controller.movie.director}',
                                    ),
                                    Text(
                                      'Language: ${controller.movie.language}',
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 16,
                  ),
                  child: Divider(),
                ),
                Observer(builder: (_) {
                  if (controller.movie.ratings.isEmpty) {
                    return Container();
                  }
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.movie.ratings
                            .map(
                              (e) => Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(child: Text(e.source)),
                                        Text(e.value),
                                      ],
                                    ),
                                    Divider(height: 8),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                }),
                Observer(
                  builder: (_) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            "Resume",
                          ),
                          subtitle: Text(controller.movie.writer),
                        ),
                      ),
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            "Plot",
                          ),
                          subtitle: Text(controller.movie.plot),
                        ),
                      ),
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(
                            "Actors",
                          ),
                          subtitle: Text(controller.movie.actors),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
