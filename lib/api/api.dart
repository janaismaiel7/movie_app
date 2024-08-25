import 'dart:convert';

import 'package:movies_app/api/api_constant.dart';
import 'package:movies_app/model/popular_response.dart';
import 'package:http/http.dart' as http;

class Api {
  static String upComingUrl='https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiConstant.apiKey}';
  static String popularUrl='https://api.themoviedb.org/3/movie/popular?api_key=${ApiConstant.apiKey}';
  static String topRatedUrl='https://api.themoviedb.org/3/movie/top_rated?api_key=${ApiConstant.apiKey}';
  static Future <List<Results>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(upComingUrl));
    if(response.statusCode==200){
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Results> movies=data.map((movie)=> Results.fromJson(movie)).toList();
      return movies;
    }else{
      throw Exception('Failed to load up coming movies');
    }
  }
  static Future <List<Results>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularUrl));
    if(response.statusCode==200){
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Results> movies=data.map((movie)=> Results.fromJson(movie)).toList();
      return movies;
    }else{
      throw Exception('Failed to load up coming movies');
    }
  }
  static Future <List<Results>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedUrl));
    if(response.statusCode==200){
      final List<dynamic> data = jsonDecode(response.body)['results'];
      List<Results> movies=data.map((movie)=> Results.fromJson(movie)).toList();
      return movies;
    }else{
      throw Exception('Failed to load up coming movies');
    }
  }

}