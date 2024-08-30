import 'package:flutter/material.dart';
import 'package:movies_app/details_screen/details_screen.dart';
import 'package:movies_app/model/popular_response.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../api/api_constant.dart';
import '../../my_app_colors.dart';

class MoreLikeThisMovies extends StatelessWidget {
  final List<Results> movie;
  final int index;

  MoreLikeThisMovies({required this.movie, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width * 0.33,
          height: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
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
                errorWidget: (context, url, error) =>
                    Icon(Icons.error), // Error icon
              ),
            ),
          ),
        ),
      ],
    );
  }
}
