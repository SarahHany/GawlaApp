import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import '../../../../shared/helper/mangers/size_config.dart';
import '../../../widgets/app_text.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        AppText(
          text: 'Welcome To Gawlah App',
          isTitle: true,
          color: ColorsManger.darkBlue,
          align: TextAlign.center,
        ),
        Spacer(
          flex: 1,
        ),
        AppText(
          text: text!,
          align: TextAlign.center,
          maxLines: 3,
          textSize: 18,
        ),
        Spacer(flex: 2),
        Image.asset(image!,height: getProportionateScreenHeight(265),
            width: getProportionateScreenWidth(235))
      ],
    );
  }
}
