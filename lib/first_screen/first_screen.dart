import 'package:flutter/material.dart';
import 'package:movies_app/browse_screen/categoryFragment.dart';
import 'package:movies_app/home_screen/home_screen.dart';
import 'package:movies_app/my_app_colors.dart';
import 'package:movies_app/search_screen/search_screen.dart';
import 'package:movies_app/watchList_screen/watchList_screen.dart';

class FirstScreen extends StatefulWidget {
  static String routeName = 'first_screen';

  @override
  State<FirstScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FirstScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchlistScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.bgColor,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: MyAppColors.blackColor),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'SEARCH',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'BROWSES',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'WATCHLIST',
            ),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
