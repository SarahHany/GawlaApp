import 'package:flutter/material.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/ui/widgets/app_text.dart';

class CustomCardInfo extends StatelessWidget {
  String title;
  String detials;


  CustomCardInfo( this.title, this.detials);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorsManger.lightGrey,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20.0) ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(text: '${title}',textSize: 17,color: ColorsManger.grey,),
              SizedBox(height: getProportionateScreenHeight(5.0),),
              AppText(text: '${detials}',textSize: 20,color: ColorsManger.black,),
            ],
          ),
        ),
    );
  }
}