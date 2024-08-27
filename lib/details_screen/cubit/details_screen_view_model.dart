import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/api/api.dart';
import 'package:movies_app/details_screen/cubit/details_screen_state.dart';

class DetailsScreenViewModel extends Cubit<DetailsScreenState>{
  DetailsScreenViewModel():super(LoadingStateDetails());
  void getDetailsAboutMovie(int movieId)async{
    emit(LoadingStateDetails());
    try {
      var response = await Api.getDetailsAboutMovie(movieId);
      if(response!=null){
        emit(SuccessStateDetails(response:response));
      } else{
        emit(ErrorStateDetails(message:'No movies found'));
      }
    } catch(e){
      emit(ErrorStateDetails(message: e.toString()));

    }

  }

}