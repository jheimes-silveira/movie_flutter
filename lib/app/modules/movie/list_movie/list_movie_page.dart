import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:js_ui_components/js_ui_components.dart';
import 'package:movie_flutter/app/modules/movie/core/model/movie.dart';
import 'package:movie_flutter/app/modules/movie/widgets/item_movie_tile.dart';

import 'list_movie_controller.dart';

class ListMoviePage extends StatefulWidget {
  @override
  _ListMoviePageState createState() => _ListMoviePageState();
}

class _ListMoviePageState
    extends ModularState<ListMoviePage, ListMovieController> {
  @override
  void initState() {
    super.initState();

    controller.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Observer(builder: (_) {
        return Column(
          children: <Widget>[
            _buildHeaderTypeMovie(),
            _buildListPaginator(),
          ],
        );
      }),
    );
  }

  Widget _buildHeaderTypeMovie() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Observer(
                builder: (_) {
                  return _buildTypeMovie(
                    'Movies',
                    controller.type == Movie.typeMovie,
                    () {
                      controller.setTypeMovie(Movie.typeMovie);
                      controller.paginator = null;
                      controller.find();
                    },
                  );
                },
              ),
              Container(
                height: 40,
                width: 1,
                color: Colors.grey,
              ),
              Observer(
                builder: (_) {
                  return _buildTypeMovie(
                    'Series',
                    controller.type == Movie.typeSerie,
                    () {
                      controller.setTypeMovie(Movie.typeSerie);
                      controller.paginator = null;
                      controller.find();
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  Widget _buildListPaginator() {
    return Expanded(
      child: JsListPaginatorView(
        shrinkWrap: true,
        onHaveMorePage: () {
          controller.paginator.currentPage++;
          controller.find();
        },
        onRefresh: () {
          controller.paginator = null;
          controller.find();
        },
        padding: EdgeInsets.only(
          bottom: 16,
        ),
        loading: controller.loading || controller.paginator == null,
        emptyState: Center(
          child: JsEmptyState(
            title: 'Opss... nenhum catalogo disponível',
            subtitle: 'Não foi encontrado nenhum catalogo disponível',
          ),
        ),
        page: controller.paginator,
        itemBuilder: (BuildContext context, int index) {
          final model = controller.paginator.data[index];

          return ItemMovieTile(
            model,
            onTap: () {
              controller.goToMovie(model.imdbID);
            },
          );
        },
      ),
    );
  }

  Widget _buildTypeMovie(
    String title,
    bool selected,
    Function onTap,
  ) {
    Color backgroundColor;
    Color textColor;

    if (selected) {
      backgroundColor = Theme.of(context).primaryColor;
      textColor = Colors.white;
    }

    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: textColor,
              ),
        ),
        padding: EdgeInsets.only(
          right: 16,
          left: 16,
          top: 10,
          bottom: 10,
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Observer(builder: (_) {
        if (controller.inResearch) {
          return _buildInResearch();
        }
        return _buildSearch();
      }),
    );
  }

  Row _buildSearch() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            '${controller.query}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.search,
          ),
          color: Colors.grey,
          onPressed: () {
            controller.setInResearch(true);
          },
        ),
      ],
    );
  }

  Row _buildInResearch() {
    return Row(
      children: <Widget>[
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.close,
          ),
          color: Colors.grey,
          onPressed: () {
            controller.inputController.text = controller.query;
            controller.setInResearch(false);
          },
        ),
        Expanded(
          child: TextField(
            controller: controller.inputController,
            autofocus: true,
            cursorColor: Colors.grey,
            decoration: InputDecoration(),
            onSubmitted: (_) {
              _onSearch();
            },
          ),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.send,
          ),
          color: Colors.grey,
          onPressed: _onSearch,
        ),
      ],
    );
  }

  _onSearch() {
    controller.paginator = null;
    controller.setQuery(
      controller.inputController.text.trim(),
    );
    controller.setInResearch(false);
    controller.find();
  }
}
