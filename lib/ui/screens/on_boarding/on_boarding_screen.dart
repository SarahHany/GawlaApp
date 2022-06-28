import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/ui/screens/login_screen/login_screen.dart';
import 'package:tour_app/ui/screens/welcome_screen/welcome_screen.dart';
import '../../../shared/helper/mangers/constants.dart';
import '../../../shared/helper/mangers/size_config.dart';
import '../../../shared/helper/methods.dart';
import '../../../shared/services/local/cache_helper.dart';
import '../../widgets/app_text.dart';
import 'components/body.dart';
import 'cubit/on_boarding_cubit.dart';
import 'cubit/on_boarding_states.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfigManger().init(context);
    return BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
          listener: (context, state) {
            if (state is GoToSignIn) {
              //navigateToAndFinish(context, SignInScreen());
            } else if (state is GoToHome) {
              //navigateToAndFinish(context, MainLayout());
            } else if (state is GoToCompleteProfile) {
              //navigateToAndFinish(context, CompleteProfileScreen());
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Body(),
              appBar: AppBar(
                actions: [
                  TextButton(
                    onPressed: () {
                      /*submit(context);*/
                      navigateTo(context, WelcomeScreen());
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          end: getProportionateScreenHeight(20.0)),
                      child:AppText(text: 'Skip',textSize: 20.0,color: ColorsManger.darkBlue),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  static void submit(BuildContext context) {
    CachedHelper.saveData(key: ConstantsManger.ON_BOARDING, value: true)
        .then((value) {
      if (value) {
      navigateToAndFinish(context, WelcomeScreen());
      }
    });
  }
}
