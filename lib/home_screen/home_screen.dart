import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/home_screen/cubit/home_screen_state.dart';
import 'package:movies_app/home_screen/cubit/new_releases_view_model.dart';
import 'package:movies_app/home_screen/cubit/popular_view_model.dart';
import 'package:movies_app/home_screen/cubit/top_rated_view_model.dart';
import 'package:movies_app/home_screen/popular_movies/popular_movie.dart';
import 'package:movies_app/home_screen/top_rated_movies/top_rated_movies.dart';
import 'package:movies_app/my_app_colors.dart';
import '../model/popular_response.dart';
import 'new_releases_movies/new_releases_movie.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PopularViewModel popularViewModel = PopularViewModel();
  NewReleasesViewModel newReleasesViewModel = NewReleasesViewModel();
  TopRatedViewModel topRatedViewModel = TopRatedViewModel();

  @override
  void initState() {
    super.initState();
    popularViewModel.getPopularMovies();
    newReleasesViewModel.getNewReleases();
    topRatedViewModel.getTopRatedMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => popularViewModel,
          ),
          BlocProvider<NewReleasesViewModel>(
            create: (context) => newReleasesViewModel,
          ),
          BlocProvider<TopRatedViewModel>(
            create: (context) => topRatedViewModel,
          ),
        ],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              BlocBuilder<PopularViewModel, HomeScreenState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: MyAppColors.primaryColor,
                      ),
                    );
                  } else if (state is ErrorState) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.errorMessage),
                          ElevatedButton(
                            onPressed: () {
                              popularViewModel.getPopularMovies();
                            },
                            child: Text('Try Again'),
                          ),
                        ],
                      ),
                    );
                  } else if (state is SuccessState) {
                    List<Results> movies = state.movie;
                    return PopularMovie(
                      movies: movies,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: MyAppColors.primaryColor,
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.19,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'New Releases',
                  style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.titleMedium),
                ),
              ),
              BlocBuilder<NewReleasesViewModel, HomeScreenState>(
                  builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: MyAppColors.primaryColor,
                    ),
                  );
                } else if (state is ErrorState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.errorMessage),
                        ElevatedButton(
                          onPressed: () {
                            newReleasesViewModel.getNewReleases();
                          },
                          child: Text('Try Again'),
                        ),
                      ],
                    ),
                  );
                } else if (state is SuccessState) {
                  final movies = state.movie;
                  return SizedBox(
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return NewReleasesMovie(movie: movies, index: index);
                        }),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: MyAppColors.primaryColor,
                  ),
                );
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Top Rated',
                  style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.titleMedium),
                ),
              ),
              BlocBuilder<TopRatedViewModel, HomeScreenState>(
                  builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: MyAppColors.primaryColor,
                    ),
                  );
                } else if (state is ErrorState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.errorMessage),
                        ElevatedButton(
                          onPressed: () {
                            topRatedViewModel.getTopRatedMovie();
                          },
                          child: Text('Try Again'),
                        ),
                      ],
                    ),
                  );
                } else if (state is SuccessState) {
                  final movies = state.movie;
                  return SizedBox(
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return TopRatedMovies(movie: movies, index: index);
                        }),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    color: MyAppColors.primaryColor,
                  ),
                );
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
