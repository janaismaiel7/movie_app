import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/browse_screen/categoryDetailsIteam.dart';
import 'package:movies_app/model/Category.dart';
import 'package:movies_app/model/popular_response.dart';
import 'package:movies_app/my_app_colors.dart';
import 'package:movies_app/watchList_screen/WatchListIteam.dart';

class Categorydetails extends StatefulWidget {
  final Category category;

  Categorydetails({required this.category});
  static const routname = 'categoryDetails';

  @override
  State<Categorydetails> createState() => _CategorydetailsState();
}

class _CategorydetailsState extends State<Categorydetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Browser',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Results>>(
          future: Api.getMoviesforCategories(widget.category.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('Try Again'),
                  ),
                ],
              );
            } else if (snapshot.hasData) {
              var movies = snapshot.data!;
              var filteredMovies = movies
                  .where((movie) => movie.genreIds!.contains(widget.category.id))
                  .toList();
              return ListView.separated(
                itemCount: filteredMovies.length,
                separatorBuilder: (context, index) => Divider(
                  color: MyAppColors.greyColor,
                  thickness: 1.0,
                ),
                itemBuilder: (context, index) {
                  return Categorydetailsiteam(movie: filteredMovies[index], category: widget.category,);
                },
              );
            } else {
              // Return a default widget if no other conditions are met
              return Center(
                child: Text(
                  'No data found',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
