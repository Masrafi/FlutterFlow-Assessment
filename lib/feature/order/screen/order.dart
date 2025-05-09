import 'package:atbjobsapp/config/theme/app_text_style.dart';
import 'package:atbjobsapp/config/theme/colors.dart';
import 'package:atbjobsapp/core/utils/appbar_widget.dart';
import 'package:atbjobsapp/core/utils/app_button.dart';
import 'package:atbjobsapp/core/utils/assets/image_assets.dart';
import 'package:atbjobsapp/feature/order/widgets/product_info.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductInfo(name: 'Bell Pepper', image: icPepper),
                    ProductInfo(name: 'Carrot', image: icCarrot),
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              Text("Meats", style: AppTextStyle.appBarStyle(),),
              const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductInfo(name: 'Lean Beef', image: icBeef),
                    ProductInfo(name: 'Salmon', image: icSalmon),
                  ],
                ),
              ),
              const SizedBox(height: 16,),
              Text("Carbs", style: AppTextStyle.appBarStyle(),),
              const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductInfo(name: 'Lean Beef', image: icCorn),
                    ProductInfo(name: 'Salmon', image: icRice),
                  ],
                ),
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
                  Text("1198 Cal out of 1200 Cal", style: AppTextStyle.hintTextStyle().copyWith(fontSize: 14),)
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
    );
  }
}