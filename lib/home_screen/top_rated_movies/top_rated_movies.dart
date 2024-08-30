import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/details_screen/details_screen.dart';
import 'package:movies_app/model/popular_response.dart';
import 'package:movies_app/my_app_colors.dart';
import 'package:movies_app/watchList/watchListServices.dart';

import '../../api/api_constant.dart';

class TopRatedMovies extends StatelessWidget {
  final List<Results> movie;
  final int index;

  TopRatedMovies({required this.movie, required this.index});

  final Watchlistservices watchlistservices = Watchlistservices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width * 0.33,
          height: MediaQuery.of(context).size.width * 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(DetailsScreen.routeName,
                    arguments: movie[index].id!);
              },
              child: CachedNetworkImage(
                imageUrl: '${ApiConstant.apiImage}${movie[index].backdropPath}',
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
        ),
        Container(
          color: MyAppColors.greyColor.withOpacity(0.5),
          child: IconButton(
              onPressed: () {
                watchlistservices.addToWatchList(movie[index]);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Added to WatchList'),
                ));
              },
              icon: Icon(
                Icons.add,
                color: MyAppColors.blackColor,
              )),
        )
      ],
    );
  }
}
