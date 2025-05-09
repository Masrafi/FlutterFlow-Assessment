import 'package:atbjobsapp/config/theme/app_text_style.dart';
import 'package:atbjobsapp/config/theme/colors.dart';
import 'package:atbjobsapp/core/utils/appBar_widget.dart';
import 'package:atbjobsapp/core/utils/app_box_decoration.dart';
import 'package:atbjobsapp/core/utils/app_button.dart';
import 'package:atbjobsapp/core/utils/assets/image_assets.dart';
import 'package:atbjobsapp/feature/details/widgets/dropdown_service.dart';
import 'package:atbjobsapp/core/utils/svg_image.dart';
import 'package:atbjobsapp/feature/details/widgets/text_field.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: [
        Column(
        
        children: [
          const AppbarWidget(text: 'Enter your details'),
          Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const SizedBox(height: 20,),
              Text("Gender", style: AppTextStyle.textFieldOptionStyle(),),
              const SizedBox(height: 7,),
              CustomDropdown(
                items: const ['Male', 'Female', 'Others'],
                label: 'Fruits',
                onChanged: (val) {
                  debugPrint('Selected: $val');
                },
              ),
              const SizedBox(height: 20,),
              Text("Weight", style: AppTextStyle.textFieldOptionStyle(),),
              const SizedBox(height: 10,),
              CustomStyledTextField(
                label: 'Enter your weight',
                suffixText: 'cm',
                onChanged: (val) {
                  debugPrint('Entered: $val');
                },
              ),
              
              
              const SizedBox(height: 20,),
              Text("Height", style: AppTextStyle.textFieldOptionStyle(),),
              const SizedBox(height: 10,),
              CustomStyledTextField(
                      label: 'Enter your height',
                      suffixText: 'cm',
                      onChanged: (val) {
                        debugPrint('Entered: $val');
                      },
                    ), 
              const SizedBox(height: 20,),
              Text("Age", style: AppTextStyle.textFieldOptionStyle(),),
              const SizedBox(height: 10,),
              CustomStyledTextField(
                      label: 'Enter your age',
                      suffixText: '',
                      onChanged: (val) {
                        debugPrint('Entered: $val');
                      },
                    ),
              ],
              ),
            ),
          ))
          
        
        ],
        ),
        Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
          child: MyButton(text: 'Next', onPressed: (){Navigator.pushNamed(context, '/order');}),
        ))
      ],
    ),
    );
  }
}
