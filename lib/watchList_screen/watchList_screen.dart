import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/popular_response.dart';
import 'package:movies_app/my_app_colors.dart';
import 'package:movies_app/watchList_screen/WatchListIteam.dart';


class WatchlistScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.transparent,
      appBar: 
      AppBar(
          backgroundColor: Colors.transparent,
        title: Text('Watch List',style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(stream: 
        FirebaseFirestore.instance.collection('watchlist').snapshots(),
         builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }
          final movies =snapshot.data!.docs.map((doc)=> Results.fromJson(doc.data())).toList();
        
          return ListView.separated(
        itemCount: movies.length,
        separatorBuilder: (context, index) => Divider(
          color: MyAppColors.greyColor,
          thickness: 1.0,
        ),
        itemBuilder: (context, index) {
          return Watchlistiteam(movie: movies[index]);
            });
         }),
      )
    );
  }

}