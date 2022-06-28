import 'package:flutter/material.dart';

import '../../shared/helper/mangers/size_config.dart';

class AppText extends StatelessWidget {
  String text;
  Color? color;
  double? textSize;
  FontWeight? fontWeight;
  TextDecoration? textDecoration;
  TextAlign? align;
  bool? isTitle;
  int? maxLines;

  AppText(
      {required this.text,
      this.color,
      this.textSize,
      this.isTitle = false,
      this.fontWeight,
      this.maxLines,
      this.textDecoration,
      this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: align == null ? null : align,
      overflow: TextOverflow.ellipsis,
      style: isTitle == true
          ? TextStyle(
              decoration: textDecoration == null ? null : textDecoration,
              overflow: TextOverflow.ellipsis,
              fontSize: textSize == null
                  ? getProportionateScreenWidth(25)
                  : getProportionateScreenHeight(textSize!),
              fontWeight: FontWeight.w500,
              color: color == null ? Colors.black : color,
              height: 1.5,
            )
          : TextStyle(
              overflow: TextOverflow.ellipsis,
              decoration: textDecoration == null ? null : textDecoration,
              color: color == null ? Colors.black : color,
              fontSize: textSize == null
                  ? getProportionateScreenHeight(20.0)
                  : getProportionateScreenHeight(textSize!),
              fontWeight: fontWeight == null ? FontWeight.w400 : fontWeight,
            ),
    );
  }
}
