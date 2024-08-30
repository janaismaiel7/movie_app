import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/browse_screen/categoryScreen.dart';
import 'package:movies_app/model/Category.dart';
import 'package:movies_app/model/popular_response.dart';

class Categoryiteam extends StatelessWidget {
 Category category;

 Categoryiteam({required this.category,});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Categorydetails(category: category,)));
       },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
        
            children: [
           ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(category.imagePath,
            
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.2,),
           ),
           Positioned(
            left: 60,
            top: 60,
             child: Text(category.title,
             style: Theme.of(context).textTheme.titleMedium,),
           )
            ],
        ),
      ),
    );
  }
}