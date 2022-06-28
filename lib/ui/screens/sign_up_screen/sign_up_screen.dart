import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_stepper/stepper.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/ui/screens/sign_up_screen/page_view/basic_info_screen.dart';
import 'package:tour_app/ui/screens/sign_up_screen/page_view/payment_screen.dart';
import 'package:tour_app/ui/screens/sign_up_screen/page_view/register_screen1.dart';
import 'cubit/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  var boardController = PageController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {},
        builder: (context, state)
        {
          SignUpCubit cubit = SignUpCubit.get(context);
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: IconStepper(
                  enableStepTapping: false,
                  enableNextPreviousButtons: false,
                  activeStepBorderColor: ColorsManger.darkBlue,
                  activeStep: cubit.currentStep,
                  stepReachedAnimationEffect: Curves.fastLinearToSlowEaseIn,
                  activeStepColor: ColorsManger.darkBlue,
                  direction: Axis.horizontal,
                  icons: [
                    Icon(Icons.looks_one_outlined,color: Colors.white),
                    Icon(Icons.looks_two_outlined,color: Colors.white),
                    Icon(Icons.looks_3_outlined,color: Colors.white),
                  ],
                ),
              ),
              body: Container(
                height: double.infinity,
                width: double.infinity,
                child: PageView(
                  controller:boardController ,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    RegisterScreen1(boardController: boardController),
                    BasicInfoScreen(boardController: boardController),
                    PaymentScreen(),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
