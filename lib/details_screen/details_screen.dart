import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/details_screen/cubit/details_screen_state.dart';
import 'package:movies_app/details_screen/cubit/details_screen_view_model.dart';
import 'package:movies_app/details_screen/cubit/more_like_this_view_model.dart';
import 'package:movies_app/details_screen/more_like_this_movies.dart';
import 'package:movies_app/home_screen/cubit/home_screen_state.dart';
import 'package:movies_app/my_app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../api/api_constant.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
  static String routeName = 'DetailsScreen';
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenViewModel DetailsviewModel;
  late MoreLikeThisMoviesViewModel MoreLikeviewModel;
  late int movieId;

  @override
  void initState() {
    super.initState();
    DetailsviewModel = DetailsScreenViewModel();
    MoreLikeviewModel = MoreLikeThisMoviesViewModel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieId = ModalRoute.of(context)?.settings.arguments as int;
    DetailsviewModel.getDetailsAboutMovie(movieId);
    MoreLikeviewModel.getMoreLikeThis(movieId);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailsScreenViewModel>(
          create: (context) => DetailsviewModel,
        ),
        BlocProvider<MoreLikeThisMoviesViewModel>(
          create: (context) => MoreLikeviewModel,
        ),
      ],
      child: Scaffold(
        backgroundColor: MyAppColors.bgColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: MyAppColors.blackColor,
          title: BlocBuilder<DetailsScreenViewModel, DetailsScreenState>(
            builder: (context, state) {
              if (state is SuccessStateDetails) {
                return Text(
                  state.response.title!,
                  style: GoogleFonts.inter(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              }
              return Text('');
            },
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<DetailsScreenViewModel, DetailsScreenState>(
                  builder: (context, state) {
                    if (state is LoadingStateDetails) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: MyAppColors.primaryColor,
                        ),
                      );
                    } else if (state is ErrorStateDetails) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              DetailsviewModel.getDetailsAboutMovie(movieId);
                            },
                            child: Text('Try Again'),
                          ),
                        ],
                      );
                    } else if (state is SuccessStateDetails) {
                      var response = state.response;
                      double avgRate = response.voteAverage!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${ApiConstant.apiImage}${response.backdropPath}',
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height /
                                        2.5,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: MyAppColors.primaryColor,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 120),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.play_circle_outline,
                                        color: MyAppColors.primaryColor,
                                        size: 65,
                                      )),
                                ))
                              ]),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text(
                            response.title!,
                            style: GoogleFonts.inter(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                response.releaseDate!,
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    color: MyAppColors.midGreyColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    '${ApiConstant.apiImage}${response.posterPath}',
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                    color: MyAppColors.primaryColor,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    response.genres != null &&
                                            response.genres!.isNotEmpty
                                        ? Wrap(
                                            spacing: 8.0, //horizontal
                                            runSpacing: 8.0, //vertical
                                            children:
                                                response.genres!.map((genre) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                      color: MyAppColors
                                                          .blackColor),
                                                ),
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  genre.name!,
                                                  style: GoogleFonts.inter(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          )
                                        : Center(
                                            child: Text('No genres available'),
                                          ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text(
                                      response.overview!,
                                      style: GoogleFonts.inter(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              height: 1.5,
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: MyAppColors.primaryColor,
                                        ),
                                        Text(
                                          '${avgRate.toStringAsFixed(1)}',
                                          style: GoogleFonts.inter(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09,
                          ),
                          Text(
                            'More like this',
                            style: GoogleFonts.inter(
                              textStyle:
                                  Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: MyAppColors.primaryColor,
                      ),
                    );
                  },
                ),
                BlocBuilder<MoreLikeThisMoviesViewModel, HomeScreenState>(
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
                            ElevatedButton(
                              onPressed: () {
                                MoreLikeviewModel.getMoreLikeThis(movieId);
                              },
                              child: Text('Try Again'),
                            ),
                          ],
                        ),
                      );
                    } else if (state is SuccessState) {
                      final movies = state.movie;
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movies.length,
                          itemBuilder: (context, index) {
                            return MoreLikeThisMovies(
                                movie: movies, index: index);
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: MyAppColors.primaryColor,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
