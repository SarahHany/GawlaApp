import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/ui/widgets/app_text.dart';
import 'package:tour_app/ui/widgets/custom_button.dart';
import 'package:tour_app/ui/widgets/custom_text_form_field.dart';

import '../../../shared/helper/mangers/size_config.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: getBody(context)),
    );
  }

  Widget getBody(context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(

            width: double.infinity,
            height: SizeConfigManger.bodyHeight * 0.3,
            decoration: BoxDecoration(color: ColorsManger.darkBlue),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfigManger.bodyHeight * 0.22),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: SizeConfigManger.bodyHeight * .06),
                  AppText(
                    text: "Rate Your Tour Guide",
                    textSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: ColorsManger.grey.withOpacity(0.8),
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                      radius: SizeConfigManger.bodyHeight * 0.04,
                      backgroundColor: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorsManger.grey.withOpacity(0.8),
                            shape: BoxShape.circle),
                        height: SizeConfigManger.bodyHeight * 0.08,
                        width: SizeConfigManger.bodyHeight * 0.08,
                        child: SvgPicture.asset('assets/icons/User.svg',
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  AppText(
                    text: "Salma S.Hany",
                    textSize: 25,
                    color: ColorsManger.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),

                  SizedBox(height: getProportionateScreenHeight(15)),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    itemBuilder: (context, _) =>
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 5.0,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  AppText(
                    text: "Leave Your Comment",
                    textSize: 20,
                    color: ColorsManger.grey,
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  CustomTextFormField(
                    maxLine: 4,
                    backgroundcolors: ColorsManger.grey.withOpacity(0.7),
                    hintText: "Your Comment ..",
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30),
                    child: CustomButton(
                      text: "Submit",
                      press: () {
                        Navigator.pop(context);
                        Toast.show("Thanks For Your Feedback", context,
                            duration: 3, backgroundColor: Colors.green);
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
