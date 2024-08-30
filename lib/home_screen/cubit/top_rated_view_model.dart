import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/home_screen/cubit/home_screen_state.dart';

class TopRatedViewModel extends Cubit<HomeScreenState> {
  TopRatedViewModel() : super(LoadingState());
  void getTopRatedMovie() async {
    emit(LoadingState());
    try {
      var response = await Api.getTopRatedMovies();
      if (response != null && response.isNotEmpty) {
        emit(SuccessState(movie: response));
      } else {
        emit(ErrorState(errorMessage: ('No movies found')));
      }
    } catch (e) {
      emit(ErrorState(
          errorMessage: 'Failed to load moviesgit: ${e.toString()}'));
    }
  }
}
