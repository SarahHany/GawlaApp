import 'package:flutter/material.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/ui/widgets/app_text.dart';

class CustomPlaceCardTest extends StatelessWidget {
  dynamic onTap;


  CustomPlaceCardTest(this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: SizeConfigManger.bodyHeight * 0.22,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/fonts/test3.png')),
            borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: AppText(
            text: 'Pyramids',
            color: Colors.white,
            textSize: 30,
          ),
        ),
      ),
    );
  }
}