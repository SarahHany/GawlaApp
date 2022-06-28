import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/shared/helper/icon_broken.dart';

import '../../../../shared/helper/mangers/size_config.dart';
import '../../../widgets/app_text.dart';

class CustomBottomCard extends StatelessWidget {
  final onTap;
  bool isPlayGame;
  String text;
  String? image;

  CustomBottomCard(
      {required this.onTap,
      required this.isPlayGame,
      required this.text,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: SizeConfigManger.bodyHeight * 0.15,
            width: SizeConfigManger.bodyHeight * 0.13,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(image!)),
                borderRadius: BorderRadius.circular(15.0)),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          AppText(text: '${text}', textSize: 20),
          isPlayGame
              ? IconButton(onPressed: () {}, icon: Icon(IconBroken.Play))
              : Center()
        ],
      ),
    );
  }
}
