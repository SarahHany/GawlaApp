import 'package:flutter/material.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/shared/helper/methods.dart';
import 'package:tour_app/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:tour_app/ui/widgets/app_text.dart';
import 'package:tour_app/ui/widgets/custom_button.dart';

import '../login_screen/components/background.dart';
import '../login_screen/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Background(
          isWelcome: true,
          child: Column(
            children: [
              SizedBox(
                height: SizeConfigManger.bodyHeight * .06,
              ),
              AppText(
                text: 'WELCOME TO GAWLAH! ',
                color: ColorsManger.darkBlue,
                textSize: 24,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: SizeConfigManger.screenWidth * 0.2),
                child: Container(
                    height: SizeConfigManger.bodyHeight * 0.3,
                    width: 230,
                    child: Image.asset(
                      'assets/images/welcome4.png',
                      fit: BoxFit.contain,
                    )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    end: SizeConfigManger.screenWidth * 0.25),
                child: CircleAvatar(
                    radius: SizeConfigManger.bodyHeight * 0.15,
                    backgroundImage: AssetImage('assets/images/welcome5.png')),
              ),
              SizedBox(
                height: SizeConfigManger.bodyHeight * .08,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(30.0)),
                child: CustomButton(
                  text: 'LOGIN',
                  press: () {
                    navigateTo(context, LoginScreen());

                  },
                ),
              ),
              SizedBox(
                height: SizeConfigManger.bodyHeight * .04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(30.0)),
                child: CustomButton(
                  text: 'SIGN UP',
                  color: ColorsManger.lightGrey,
                  press: () {
                    navigateTo(context, SignUpScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
