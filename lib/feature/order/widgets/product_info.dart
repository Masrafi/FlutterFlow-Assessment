import 'package:atbjobsapp/config/theme/app_text_style.dart';
import 'package:atbjobsapp/config/theme/colors.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String name;
  final String image;
  const ProductInfo({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 196,
     width: 183,
     padding: const EdgeInsets.all(10),
     margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 5),
     decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(12), // Adjust as needed
         boxShadow: [
           BoxShadow(
             color: const Color(0xFF898989).withOpacity(0.24),
             //offset: const Offset(1, 2),
             blurRadius: 5.5,
             spreadRadius: 0, // You can adjust this if needed
           ),
         ],
       ),
       child: Column(
       children: [
         //SvgImage().asset(path: icPepper)
         Image.asset(image, height: 100,),
          const SizedBox(height: 10,),
          Row(
          crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text(name, style: AppTextStyle.hintTextStyle().copyWith(color: defaultTextColor, fontWeight: FontWeight.w500),),
           const Spacer(),
           Text("12 Cal", style: AppTextStyle.hintTextStyle().copyWith(fontSize: 14),),
         ],
         ),
         const SizedBox(height: 5,),
         Row(
         children: [
           Text("\$12", style: AppTextStyle.hintTextStyle().copyWith(color: defaultTextColor, fontWeight: FontWeight.w500)),
           const Spacer(),
           Container(
           height: 32,
           width: 65,
           decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(12),
           color: addColor
           ),
           child: Center(child: Text("Add", style: AppTextStyle.hintTextStyle().copyWith(color: whiteColor),)),
           ),
          
         ],
         )
       ],
       ),
     
     );
  }
}
