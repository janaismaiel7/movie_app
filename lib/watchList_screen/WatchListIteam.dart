import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/model/popular_response.dart';

class Watchlistiteam extends StatelessWidget {
 final Results movie;
 Watchlistiteam({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: movie.posterPath??'',
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),

      ),
      title: Text(movie.title??''),
      subtitle: Text(movie.releaseDate??''),
    );
  }
}