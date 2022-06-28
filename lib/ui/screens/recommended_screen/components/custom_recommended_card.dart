import 'package:flutter/material.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';

import '../../../../shared/helper/mangers/colors.dart';
import '../../../widgets/app_text.dart';

class CustomRecommendedCard extends StatelessWidget {
  String image ;
  String text ;


  CustomRecommendedCard({required this.image, required this.text });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: SizeConfigManger.bodyHeight * 0.25,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image)),
              borderRadius: BorderRadius.circular(15.0)),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(15.0)),
          decoration: BoxDecoration(
            color: ColorsManger.backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: AppText(
                  text: '${text}', textSize: 20)),
        ),
      ],
    );
  }
}
