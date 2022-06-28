import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tour_app/layout/main_layout.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/methods.dart';
import 'package:tour_app/ui/widgets/app_text.dart';

import '../../../shared/helper/mangers/size_config.dart';
import 'components/custom_card_bottom.dart';
import 'components/custom_recommended_card.dart';

class Models {
  String image;
  String text;

  Models(this.image, this.text);
}

class RecommendedScreen extends StatelessWidget {
  List<Models> myList = [
    Models(
        "https://firebasestorage.googleapis.com/v0/b/live-b7c5f.appspot.com/o/161ec21e-0b41-4cdb-bc0e-dd372e4b95fb.jfif?alt=media&token=0ef03e90-4ea0-4066-912d-6624a82d168b",
        "Visit Egyptian Carpets factory"),
    Models("https://firebasestorage.googleapis.com/v0/b/live-b7c5f.appspot.com/o/f1b65fbe-b94e-4d89-b6b1-9bbd26dc0208.jfif?alt=media&token=876a0c08-fa35-40f2-b523-b3e6f51d4b8a",
        "DOWNTOWN CAIRO FOOD TOUR")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              right: getProportionateScreenHeight(40.0),
              left: getProportionateScreenHeight(40.0),
              top: getProportionateScreenHeight(40.0)),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Hello',
                        color: ColorsManger.black,
                      ),
                      AppText(
                          text: 'Sarah !',
                          color: ColorsManger.darkBlue,
                          textSize: 35,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: SizeConfigManger.bodyHeight * 0.045,
                        backgroundColor: Colors.white,
                        child: Container(
                          height: SizeConfigManger.bodyHeight * 0.05,
                          width: SizeConfigManger.bodyHeight * 0.05,
                          child: SvgPicture.asset('assets/icons/User.svg',
                              fit: BoxFit.contain),
                        ),
                      ),
                      AppText(
                        text: 'Profile',
                        color: ColorsManger.lightBlue,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
              Row(
                children: [
                  AppText(
                    text: 'Recommended Tours',
                    color: ColorsManger.black,
                    textSize: 18.0,
                  ),
                  Spacer(),
                  AppText(
                    text: 'See All',
                    color: ColorsManger.lightBlue,
                    textSize: 14.0,
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        CustomRecommendedCard(image: myList[index].image, text: myList[index].text),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: getProportionateScreenHeight(20.0)),
                    itemCount: 2),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15.0),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: AppText(
                  text: 'View Tours',
                  color: ColorsManger.black,
                  textSize: 18.0,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20.0),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBottomCard(
                        onTap: () {},
                        isPlayGame: false,
                        text: 'My Tours',
                        image: 'assets/images/recommended1.png',
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(15),
                      ),
                      CustomBottomCard(
                        onTap: () {
                          navigateTo(context, MainLayout());
                        },
                        isPlayGame: false,
                        text: 'All Tours',
                        image: 'assets/images/recommended2.png',
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(15),
                      ),
                      CustomBottomCard(
                        onTap: () {},
                        isPlayGame: true,
                        text: 'Play Game',
                        image: 'assets/images/recommended3.png',
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
