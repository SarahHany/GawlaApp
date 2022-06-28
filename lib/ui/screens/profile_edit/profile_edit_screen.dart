import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/ui/screens/details_screen/compoents/custom_card_info.dart';
import 'package:tour_app/ui/screens/profile_edit/compoentents/background.dart';
import 'package:tour_app/ui/widgets/custom_button.dart';

import '../../widgets/app_text.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProfileEditBackground(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: SizeConfigManger.bodyHeight * 0.08,
                    ),
                    CircleAvatar(
                      radius: SizeConfigManger.bodyHeight * 0.08,
                      backgroundColor: ColorsManger.backgroundColor,

                      child: Container(
                        height: SizeConfigManger.bodyHeight * 0.08,
                        width: SizeConfigManger.bodyHeight * 0.08,
                        child: SvgPicture.asset('assets/icons/User.svg', fit: BoxFit.contain),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfigManger.bodyHeight * 0.02,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: SizeConfigManger.screenWidth * 0.4,
              child: CustomButton(
                color: Colors.white,
                text: 'Change Photo',
                press: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(20.0)),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(30.0)),
                decoration: BoxDecoration(
                    color: ColorsManger.lightGrey,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenHeight(30.0)),
                      child: Row(
                        children: [
                          AppText(
                            text: 'Personal Details',
                            textSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          Spacer(),
                          AppText(
                            text: 'Edit',
                            textSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    CustomCardInfo('FIRST NAME', 'Sarah !'),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    CustomCardInfo('LAST NAME', 'Hassan'),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    CustomCardInfo('EMAIL', 'sarah'),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    CustomCardInfo('CONTACT No', '01032432647'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(20.0)),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(30.0)),
                decoration: BoxDecoration(
                    color: ColorsManger.lightGrey,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenHeight(30.0)),
                      child: Row(
                        children: [
                          AppText(
                            text: 'CHANGE PASSWORD',
                            textSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          Spacer(),
                          AppText(
                            text: 'Edit',
                            textSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    CustomCardInfo('PASSWORD', '******'),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    CustomCardInfo('CONFIRM PASSWORD', '******'),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: getProportionateScreenHeight(30.0),
                  bottom: getProportionateScreenHeight(30.0)),
              child: Container(
                alignment: Alignment.topRight,
                child: CustomButton(
                  width: getProportionateScreenHeight(250.0),
                  text: 'Save & Update',
                  press: () {},
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
