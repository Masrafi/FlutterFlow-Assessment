import 'package:atbjobsapp/feature/order/data/data_source/food_remote_datasource.dart';
import 'package:atbjobsapp/feature/order/domain/entities/food_entity.dart';
import 'package:atbjobsapp/feature/order/domain/repositories/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodRemoteDataSource remoteDataSource;

  FoodRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<FoodEntity>> getFoods() async {
    final models = await remoteDataSource.fetchFoods();
    print('.................... getFoods');
    return models.map((model) => FoodEntity(
      foodName: model.foodName,
      calories: model.calories,
      imageUrl: model.imageUrl,
    )).toList();
  }
  
  @override
  Future<List<FoodEntity>> getCarbs() async {
    final models = await remoteDataSource.getCarbs();
    print('.................... getCarbs');
    return models.map((model) => FoodEntity(
      foodName: model.foodName,
      calories: model.calories,
      imageUrl: model.imageUrl,
    )).toList();
  }
}
