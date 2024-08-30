import 'package:movies_app/model/popular_response.dart';

import '../../model/more_like_this_response.dart';

abstract class HomeScreenState {}

class LoadingState extends HomeScreenState {}

class SuccessState extends HomeScreenState {
  List<Results> movie;
  SuccessState({required this.movie});
}

class ErrorState extends HomeScreenState {
  String errorMessage;
  ErrorState({required this.errorMessage});
}
