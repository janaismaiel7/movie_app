import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/model/popular_response.dart';
import 'package:movies_app/my_app_colors.dart';

class Watchlistiteam extends StatelessWidget {
 final Results movie;
 Watchlistiteam({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
       
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              ClipRRect
              (
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(imageUrl:'${ApiConstant.apiImage}${movie.backdropPath}' 
                ,
                width: MediaQuery.of(context).size.width*0.5,
                height: MediaQuery.of(context).size.height*0.2,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container( width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height*0.7,
                 child: Center(child: CircularProgressIndicator()),),),
              ),
              Positioned(child: Icon(Icons.check_box,color: Colors.amber.withOpacity(0.5),
              )),
            
            ],),
          ),
            SizedBox(width: MediaQuery.of(context).size.width*0.025,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(movie.title??'',
              style: Theme.of(context).textTheme.bodyMedium,),
              SizedBox(height: 4.0),
                  Text(
                    movie.releaseDate?.substring(0, 4) ?? '',
                    style: Theme.of(context).textTheme.bodyMedium
                  ),
                
              ],
              
            ),

        ],
        
      ),
      
      
    );
  }
}