import 'package:atbjobsapp/config/theme/app_text_style.dart';
import 'package:atbjobsapp/config/theme/colors.dart';
import 'package:atbjobsapp/core/utils/appbar_widget.dart';
import 'package:atbjobsapp/core/utils/app_button.dart';
import 'package:atbjobsapp/di.dart';
import 'package:atbjobsapp/feature/order/presentation/bloc/carb_bloc.dart';
import 'package:atbjobsapp/feature/order/presentation/bloc/carb_event.dart';
import 'package:atbjobsapp/feature/order/presentation/bloc/carb_state.dart';
import 'package:atbjobsapp/feature/order/presentation/bloc/meat_bloc.dart';
import 'package:atbjobsapp/feature/order/presentation/bloc/meat_event.dart';
import 'package:atbjobsapp/feature/order/presentation/bloc/meat_state.dart';
import 'package:atbjobsapp/feature/order/presentation/bloc/food_bloc.dart';
import 'package:atbjobsapp/feature/order/presentation/bloc/food_event.dart';
import 'package:atbjobsapp/feature/order/presentation/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/food_state.dart';

class Order extends StatefulWidget {
  final double calories;
  const Order({super.key, required this.calories});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  late List<int> vegetableCounts;
  late List<int> meatCounts;
  late List<int> carbCounts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vegetableCounts = [];
    meatCounts = [];
    carbCounts = [];
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
             providers: [
               BlocProvider(create: (_) => getIt<FoodBloc>()..add(LoadVegetablesEvent())),
               BlocProvider(create: (_) => getIt<MeatBloc>()..add(LoadMeatEvent())),
               BlocProvider(create: (_) => getIt<CarbBloc>()..add(LoadCarbEvent())),
             ],
        child: Scaffold(
        body: Stack(
          children: [
            Column(
            children: [
              const AppbarWidget(text: 'Create your order'),
              Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16,),
                  Text("Vegetables", style: AppTextStyle.appBarStyle(),),
                  BlocBuilder<FoodBloc, FoodState>(
                    builder: (context, state) {
                      if (state is FoodLoading) return CircularProgressIndicator();
                      if (state is FoodLoaded) {
                        if (vegetableCounts.length != state.foods.length) {
                          vegetableCounts = List.generate(state.foods.length, (_) => 0);
                        }
                        return SizedBox(
                        height: 220,
                          child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: state.foods.length,
                            itemBuilder: (context, index) {
                              final food = state.foods[index];
                              return ProductInfo(name: food.foodName, image: food.imageUrl, cal: food.calories.toString(),
                              increase: vegetableCounts[index],
                              onTapAdd: (){
                                 setState(() {
                                   //increase++;
                                   vegetableCounts[index]++;
                                 });
                              },
                              onTapSub: (){
                                 setState(() {
                                   //increase--;
                                   if (vegetableCounts[index] > 0) vegetableCounts[index]--;
                                 });
                              },
                              );
                            },
                          ),
                        );
                      }
                      if (state is FoodError) return Text(state.message);
                      return Container();
                    },
                  ),
                  const SizedBox(height: 16,),
                  Text("Meats", style: AppTextStyle.appBarStyle(),),
                  BlocBuilder<MeatBloc, MeatState>(
                    builder: (context, state) {
                      if (state is MeatLoading) return CircularProgressIndicator();
                      if (state is MeatLoaded) {
                        if (meatCounts.length != state.meats.length) {
                          meatCounts = List.generate(state.meats.length, (_) => 0);
                        }
                        return SizedBox(
                        height: 220,
                          child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: state.meats.length,
                            itemBuilder: (context, index) {
                              final food = state.meats[index];
                              return ProductInfo(name: food.foodName, image: food.imageUrl, cal: food.calories.toString(),
                              increase: meatCounts[index],
                              onTapAdd: (){
                                 setState(() {
                                   meatCounts[index]++;
                                 });
                              },
                              onTapSub: (){
                                 setState(() {
                                   if (meatCounts[index] > 0) meatCounts[index]--;
                                 });
                              },
                              );
                            },
                          ),
                        );
                      }
                      if (state is MeatError) return Text(state.message);
                      return Container();
                    },
                  ),
                  const SizedBox(height: 16,),
                  Text("Carbs", style: AppTextStyle.appBarStyle(),),
                  BlocBuilder<CarbBloc, CarbState>(
                    builder: (context, state) {
                      if (state is CarbLoading) return CircularProgressIndicator();
                      if (state is CarbLoaded) {
                        if (carbCounts.length != state.carbs.length) {
                          carbCounts = List.generate(state.carbs.length, (_) => 0);
                        }
                        return SizedBox(
                        height: 220,
                          child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: state.carbs.length,
                            itemBuilder: (context, index) {
                              final food = state.carbs[index];
                              return ProductInfo(name: food.foodName, image: food.imageUrl, cal: food.calories.toString(),
                              increase: carbCounts[index],
                              onTapAdd: (){
                                 setState(() {
                                   carbCounts[index]++;
                                 });
                              },
                              onTapSub: (){
                                 setState(() {
                                   if (carbCounts[index] > 0) carbCounts[index]--;
                                 });
                              },
                              );
                            },
                          ),
                        );
                      }
                      if (state is CarbError) return Text(state.message);
                      return Container();
                    },
                  ),
                  const SizedBox(height: 170,),
                ],
                ),
              ),
              )),
            ],
            ),
            Align(
            alignment: Alignment.bottomCenter,
            child: Container(
            height: 164,
              width: double.infinity,
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                    children: [
                      Text("Cals", style: AppTextStyle.hintTextStyle().copyWith(color: defaultTextColor, fontWeight: FontWeight.w400),),
                      const Spacer(),
                      Text("1198 Cal out of ${widget.calories.toString()} Cal", style: AppTextStyle.hintTextStyle().copyWith(fontSize: 14),)
                    ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                    children: [
                      Text("Price", style: AppTextStyle.hintTextStyle().copyWith(color: defaultTextColor, fontWeight: FontWeight.w400),),
                      const Spacer(),
                      Text("\$ 125", style: AppTextStyle.hintTextStyle().copyWith(fontSize: 14, color: addColor),)
                    ],
                    ),
                    const SizedBox(height: 10,),
                    MyButton(text: 'Place Order', isDisabled: false, onPressed: (){Navigator.pushNamed(context, '/orderSummary');}),
                  ],
                ),
              ),
            ))
          ],
        ),
        ),
    );
  }
}