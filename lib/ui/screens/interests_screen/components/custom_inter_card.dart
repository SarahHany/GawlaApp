import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/ui/widgets/app_text.dart';

class CustomInterestCard extends StatelessWidget {
  String prefix;
  String title;
  bool isSelected;

  CustomInterestCard(
      {required this.prefix, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(5),
          horizontal: getProportionateScreenHeight(25.0)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: isSelected ? ColorsManger.darkBlue : ColorsManger.grey,
            width: 3),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        children: [
          Image.asset(
            prefix,
            height: getProportionateScreenHeight(60.0),
            width: getProportionateScreenHeight(60.0),
          ),
          SizedBox(
            width: 15.0,
          ),
          AppText(
            text: title,
            color: ColorsManger.darkGrey,
          ),
        ],
      ),
    );
  }
}
