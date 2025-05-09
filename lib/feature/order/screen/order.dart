import 'package:atbjobsapp/config/theme/app_text_style.dart';
import 'package:atbjobsapp/config/theme/colors.dart';
import 'package:atbjobsapp/core/utils/appBar_widget.dart';
import 'package:atbjobsapp/core/utils/assets/image_assets.dart';
import 'package:atbjobsapp/core/utils/svg_image.dart';
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
    body: Column(
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
          )
        ],
        ),
      ),
      )),
    ],
    ),
    );
  }
}