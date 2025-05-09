import 'package:atbjobsapp/feature/order/domain/usecases/fetch_foods_usecase.dart';
import 'package:atbjobsapp/feature/order/presentation/bloc/curb_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'curb_event.dart';

class CarbBloc extends Bloc<CarbEvent, CarbState> {
  final FetchFoodsUseCase fetchFoodsUseCase;

  CarbBloc(this.fetchFoodsUseCase) : super(CarbInitial()) {
    on<LoadCarbsEvent>((event, emit) async {
      emit(CarbLoading());
      try {
        final carbs = await fetchFoodsUseCase.getCarbs();
        emit(CarbLoaded(carbs));
      } catch (e) {
        emit(CarbError("Failed to load carbs"));
      }
    });
  }
}
