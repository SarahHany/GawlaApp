import 'package:flutter/material.dart';

import '../../shared/helper/mangers/colors.dart';
import '../../shared/helper/mangers/size_config.dart';
import 'app_text.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.press,
    this.width,
    this.color
  }) : super(key: key);
  final String? text;
  final Function? press;
  final double ? width;
  final Color ? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ==null ? double.infinity : getProportionateScreenHeight(width!),
      height: getProportionateScreenHeight(60),
      decoration: BoxDecoration(
        color: color == null ? ColorsManger.darkBlue:ColorsManger.lightGrey,
        borderRadius: BorderRadius.circular(getProportionateScreenHeight(20.0))
      ),
      child:MaterialButton( 
        onPressed:press as void Function(),
        child: AppText(
          color: color ==null ? Colors.white:ColorsManger.black,
          text: text!,
          textSize: getProportionateScreenHeight(20.0),
        ) ,
      ),
    );
  }
}
