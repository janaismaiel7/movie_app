import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/home_screen/cubit/home_screen_state.dart';

class MoreLikeThisMoviesViewModel extends Cubit<HomeScreenState>{
  MoreLikeThisMoviesViewModel():super(LoadingState());
  void getMoreLikeThis(int movieId) async {
    emit(LoadingState());
    try{
      var response = await Api.getMoreLikeThis(movieId);;
      if(response!=null&& response.isNotEmpty){
        emit(LoadingState());
        emit(SuccessState(movie: response));
      }else{
        emit(ErrorState(errorMessage: ('No movies found')));
      }

    } catch(e){
      emit(ErrorState(errorMessage: 'Failed to load movies: ${e.toString()}'));
    }
  }

}