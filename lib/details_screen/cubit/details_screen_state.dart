import 'package:movies_app/model/details_response.dart';

abstract class DetailsScreenState{}
class SuccessStateDetails extends DetailsScreenState{
  DetailsResponse response;
  SuccessStateDetails({required this.response});
}
class ErrorStateDetails extends DetailsScreenState{
  String message;
  ErrorStateDetails({required this.message});
}
class LoadingStateDetails extends DetailsScreenState{}