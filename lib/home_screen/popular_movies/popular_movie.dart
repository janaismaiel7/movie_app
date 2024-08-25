import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/model/popular_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movies_app/my_app_colors.dart';

class PopularMovie extends StatefulWidget {
  final List<Results> movies;

  PopularMovie({required this.movies});

  @override
  _PopularMovieState createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarouselSlider.builder(
          itemCount: widget.movies.length,
          itemBuilder: (context, itemIndex, realIndex) {
            final movie = widget.movies[itemIndex];
            return Container(
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: '${ApiConstant.apiImage}${movie.backdropPath}',
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: MyAppColors.primaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),

              ),
            );
          },
          options: CarouselOptions(
            onPageChanged: (newIndex, reason) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            autoPlay: true,
            aspectRatio: 1.6,
            autoPlayAnimationDuration: Duration(seconds: 15),
            enlargeCenterPage: true,
            viewportFraction: 1.0,
          ),
        ),
        Positioned(
          top: 150,
          left: 20,
          right: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstant.apiImage}${widget.movies[_currentIndex].posterPath}' ,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.25,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: MyAppColors.primaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.02),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movies[_currentIndex].title!,
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                      Text(
                        widget.movies[_currentIndex].overview!,
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.5,
                          ),
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01),
                      Text(
                        widget.movies[_currentIndex].releaseDate!,
                        style: GoogleFonts.inter(
                          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
