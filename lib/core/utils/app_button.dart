import 'package:atbjobsapp/config/theme/app_text_style.dart';
import 'package:atbjobsapp/config/theme/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDisabled,
    this.disabledOnPressed
  });

  final String text;
  final VoidCallback onPressed;
  bool? isDisabled = false;
  final VoidCallback? disabledOnPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled == true ? disabledOnPressed : onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDisabled == true ? borderColor : borderColor,
          // border: Border.all(
          //   width: 1.0,
          //   //color: whiteColor,
          // ),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
              ),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.hintTextStyle().copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
