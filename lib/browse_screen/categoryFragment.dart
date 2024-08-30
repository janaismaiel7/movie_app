import 'package:flutter/material.dart';
import 'package:movies_app/browse_screen/categoryIteam.dart';
import 'package:movies_app/model/Category.dart';

class BrowseScreen extends StatelessWidget {
  var categoryList =Category.getCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        title: Text('Browse Category',style: Theme.of(context).textTheme.titleLarge,),

      ),
      body: GridView.builder(
        itemCount: categoryList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing:5,
          mainAxisSpacing: 5,
          ), 
        itemBuilder: (context, index){
return Categoryiteam(category: categoryList[index], );
        }),
    );
  }
}
