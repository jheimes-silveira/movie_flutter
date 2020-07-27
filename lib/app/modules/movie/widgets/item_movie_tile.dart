import 'package:flutter/material.dart';
import 'package:js_ui_components/js_ui_components.dart';
import 'package:movie_flutter/app/modules/movie/core/model/movie.dart';

class ItemMovieTile extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  const ItemMovieTile(
    this.movie, {
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        right: 16,
        left: 16,
        top: 16,
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        onTap: onTap,
        child: Row(
          children: <Widget>[
            JsNetworkImage(
              imageUrl: movie.poster,
              circular: false,
              height: 80,
              width: 80,
              errorWidget: Icon(
                Icons.image,
                color: Colors.white.withOpacity(0.5),
                size: 50,
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  movie.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                subtitle: Text(movie.year),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
