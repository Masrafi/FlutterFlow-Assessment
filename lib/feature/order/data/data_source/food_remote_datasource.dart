import 'package:atbjobsapp/feature/order/data/model/food_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FoodRemoteDataSource {
  Future<List<FoodModel>> fetchFoods();
  Future<List<FoodModel>> getMeats();
  Future<List<FoodModel>> getCarbs();
}

class FirebaseFoodRemoteDataSource implements FoodRemoteDataSource {
  final FirebaseFirestore firestore;

  FirebaseFoodRemoteDataSource(this.firestore);

  @override
  Future<List<FoodModel>> fetchFoods() async {
    final snapshot = await firestore.collection('foods').get();
    return snapshot.docs.map((doc) => FoodModel.fromJson(doc.data())).toList();
  }
  
  
  @override
  Future<List<FoodModel>> getMeats() async {
      final snapshot = await firestore.collection('carb').get();
          return snapshot.docs.map((doc) => FoodModel.fromJson(doc.data())).toList();
    }  
    
  @override
  Future<List<FoodModel>> getCarbs() async {
      final snapshot = await firestore.collection('meat').get();
          return snapshot.docs.map((doc) => FoodModel.fromJson(doc.data())).toList();
    }
}
