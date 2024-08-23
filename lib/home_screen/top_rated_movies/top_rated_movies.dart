import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/model/popular_response.dart';
import 'package:movies_app/my_app_colors.dart';

class TopRatedMovies extends StatelessWidget {
  final List<Results> movie;
  final int index;

  TopRatedMovies({required this.movie, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width * 0.33,
          height:MediaQuery.of(context).size.width * 0.5 ,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/original/${movie[index].backdropPath}',
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: MyAppColors.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }
}
