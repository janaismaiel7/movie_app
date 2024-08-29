import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/model/popular_response.dart';
import 'package:movies_app/my_app_colors.dart';
import 'package:movies_app/watchList/watchlistIteam.dart';

class WatchlistScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.transparent,
      appBar: 
      AppBar(
        title: Text('Watch List',style: Theme.of(context).textTheme.titleLarge,),
      ),
      body: StreamBuilder(stream: 
      FirebaseFirestore.instance.collection('watchlist').snapshots(),
       builder: (context,snapshot){
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }
        final movies =snapshot.data!.docs.map((doc)=> Results.fromJson(doc.data())).toList();

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context,index){
            return Watchlistiteam( movie: movies[index]);
          });
       })
    );
  }

}