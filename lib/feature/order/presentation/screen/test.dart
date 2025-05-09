// import 'package:atbjobsapp/di.dart';
// import 'package:atbjobsapp/feature/order/presentation/bloc/food_bloc.dart';
// import 'package:atbjobsapp/feature/order/presentation/bloc/food_event.dart';
// import 'package:atbjobsapp/feature/order/presentation/bloc/food_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class FoodPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => getIt<FoodBloc>()..add(LoadFoodsEvent()),
//       child: Scaffold(
//         appBar: AppBar(title: Text("Foods")),
//         body: BlocBuilder<FoodBloc, FoodState>(
//           builder: (context, state) {
//             if (state is FoodLoading) return CircularProgressIndicator();
//             if (state is FoodLoaded) {
//               return ListView.builder(
//                 itemCount: state.foods.length,
//                 itemBuilder: (context, index) {
//                   final food = state.foods[index];
//                   return ListTile(
//                     title: Text(food.foodName),
//                     subtitle: Text("${food.calories} cal"),
//                     leading: Image.network(food.imageUrl),
//                   );
//                 },
//               );
//             }
//             if (state is FoodError) return Text(state.message);
//             return Container();
//           },
//         ),
//       ),
//     );
//   }
// }
