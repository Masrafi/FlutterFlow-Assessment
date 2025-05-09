
import 'package:equatable/equatable.dart';

abstract class CarbEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCarbsEvent extends CarbEvent {}
