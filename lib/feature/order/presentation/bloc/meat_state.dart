
import 'package:atbjobsapp/feature/order/domain/entities/food_entity.dart';
import 'package:equatable/equatable.dart';

abstract class MeatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MeatInitial extends MeatState {}

class MeatLoading extends MeatState {}

class MeatLoaded extends MeatState {
  final List<FoodEntity> carbs;

  MeatLoaded(this.carbs);

  @override
  List<Object?> get props => [carbs];
}

class MeatError extends MeatState {
  final String message;

  MeatError(this.message);

  @override
  List<Object?> get props => [message];
}
