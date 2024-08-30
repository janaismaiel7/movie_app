import 'dart:convert';

import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/model/details_response.dart';
import 'package:movies_app/model/popular_response.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/search_response.dart';

class Api {
  static String upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiConstant.apiKey}';
  static String popularUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${ApiConstant.apiKey}';
  static String topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${ApiConstant.apiKey}';
  static String SearchUrl =
      'https://api.themoviedb.org/3/search/movie?api_key=${ApiConstant.apiKey}';
  static Future<List<Results>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(upComingUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Results> movies =
          data.map((movie) => Results.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load up coming movies');
    }
  }

  static Future<List<Results>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Results> movies =
          data.map((movie) => Results.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load up coming movies');
    }
  }

  static Future<List<Results>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Results> movies =
          data.map((movie) => Results.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load up coming movies');
    }
  }

  static Future<DetailsResponse> getDetailsAboutMovie(int movieId) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=${ApiConstant.apiKey}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return DetailsResponse.fromJson(data);
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  static Future<List<Results>> getMoreLikeThis(int movieId) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=${ApiConstant.apiKey}'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Results> movies =
          data.map((movie) => Results.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to more like this movies');
    }
  }

  static Future<List<SearchResults>> searchList(String searchVal) async {
    final response =
        await http.get(Uri.parse('${SearchUrl}&query=${searchVal}'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var searchJson = data['results'] as List;
      List<SearchResults> searchResultsList =
          searchJson.map((json) => SearchResults.fromJson(json)).toList();
      return searchResultsList;
    }
    throw Exception('Failed to load search results');
  }

  static Future<List<Results>> getMoviesforCategories(int movieId) async {
    final response = await http.get(Uri.parse(upComingUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Results> movies =
          data.map((movie) => Results.fromJson(movie)).toList();
      return movies;
    } else {
      throw Exception('Failed to load up coming movies');
    }
  }
}
