import 'package:flutter/material.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/shared/helper/methods.dart';
import 'package:tour_app/ui/screens/details_screen/details_screen.dart';
import 'package:tour_app/ui/widgets/app_text.dart';

import '../../../../model/TourModel.dart';

class CustomPlaceCard extends StatelessWidget {

  TourModel tourModel;

  CustomPlaceCard({required this.tourModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        navigateTo(context, DetailsScreen(tourModel: tourModel,isFromALlTours: true,));
      } ,
      child: Container(
        width: SizeConfigManger.bodyHeight * 0.22,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${tourModel.coverPhoto}')),
            borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: AppText(
            text: '${tourModel.name}',
            color: Colors.white,
            maxLines: 2,
            fontWeight: FontWeight.w500,
            textSize: 22,
          ),
        ),
      ),
    );
  }
}
