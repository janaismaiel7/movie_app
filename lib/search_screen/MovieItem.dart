
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/details_screen/details_screen.dart';

import '../api/api_constant.dart';
import '../model/search_response.dart';
import '../my_app_colors.dart';

class MovieItem extends StatelessWidget {
  final SearchResults result;

  MovieItem({required this.result});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyAppColors.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(DetailsScreen.routeName , arguments: result.id);
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstant.apiImage}${result.posterPath}',
                width: MediaQuery.of(context).size.width*0.4,
                height: MediaQuery.of(context).size.height*0.3,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: MyAppColors.primaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error), // Error icon
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  result.title ?? 'No Title',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),],
        ),
      ),
    );
  }
}
