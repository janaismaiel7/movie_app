import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_app/model/popular_response.dart';

class Watchlistservices {
final FirebaseFirestore fireStore = FirebaseFirestore.instance;

void addToWatchList(Results movie) async{
  try{
    await fireStore.collection('watchlist').doc(movie.id.toString()).set(movie.toJson());
  print('added to watch list');
  }
  catch(e){
    print(e);
  }
}

Stream<List<Results>> getWatchList(){
  return fireStore.collection('watchlist').snapshots().map((snapshot)
  {
    return snapshot.docs.map((doc)=> Results.fromJson(doc.data())).toList();
  });
}
}