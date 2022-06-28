import 'package:flutter/material.dart';
import 'package:tour_app/model/TourModel.dart';
import 'package:tour_app/shared/helper/icon_broken.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/ui/widgets/app_text.dart';

import '../../../../shared/helper/mangers/colors.dart';

class CustomTourDesign extends StatelessWidget {
  TourModel tourModel;


  CustomTourDesign(this.tourModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
      child: Container(
        padding:EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)) ,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(getProportionateScreenHeight(15.0)),
        ),
        child: Row(
          children:
          [
            Container(
              height: SizeConfigManger.bodyHeight * 0.16,
              width: SizeConfigManger.bodyHeight * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(tourModel.coverPhoto??''),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(15),
            ),
            Container(
              height: SizeConfigManger.bodyHeight * 0.16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: '${tourModel.name}',
                    textSize: 22,
                    fontWeight: FontWeight.bold,
                    isTitle: true,
                  ),
                  SizedBox(height: getProportionateScreenHeight(10.0),),
                  AppText(
                      text: 'Giza , Egypt', color: ColorsManger.darkBlue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
