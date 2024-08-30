import 'package:flutter/material.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/model/search_response.dart';
import 'package:movies_app/my_app_colors.dart';

import 'MovieItem.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<SearchResults>? searchResults = [];

  void searchQuery(String query) async {
    var searchList = await Api.searchList(query);
    setState(() {
      searchResults = searchList;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  color: MyAppColors.greyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 20),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            searchQuery(value);
                          }
                        },
                      ),
                    ),
                    Icon(Icons.search, color: Colors.white, size: 35),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: searchResults!.isEmpty
                ? Center(child: Text('No results found', style: TextStyle(color: Colors.white)))
                : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: searchResults!.length,
              itemBuilder: (context, index) {
                final result = searchResults![index];
                return MovieItem(result: result);
              },
            ),
          ),
        ],
      ),
    );
  }
}

