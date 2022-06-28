import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/ui/screens/sign_up_screen/components/background.dart';
import 'package:tour_app/ui/screens/sign_up_screen/cubit/sign_up_cubit.dart';

import '../../../../shared/helper/mangers/colors.dart';
import '../../../../shared/helper/mangers/size_config.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/socal_card.dart';

class RegisterScreen1 extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var boardController;


  RegisterScreen1({required this.boardController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        SignUpCubit cubit =SignUpCubit.get(context);
        return Background(
          child: Form(
            key: formKey,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/sign_up.png',
                      height: SizeConfigManger.bodyHeight * 0.30,
                    ),
                    SizedBox(
                      height: SizeConfigManger.bodyHeight * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenHeight(30.0)),
                      child: Column(
                        children: [
                          CustomTextFormField(
                              controller: emailController,
                              hintText: 'Enter your mail address',
                              lableText: 'Email Address',

                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'email address is required';
                                }
                              },
                              type: TextInputType.emailAddress,
                              prefixIcon: 'assets/icons/User.svg'),
                          SizedBox(
                            height: SizeConfigManger.bodyHeight * 0.03,
                          ),
                          CustomTextFormField(
                            controller: passwordController,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'password address is required';
                              }
                            },
                            type: TextInputType.visiblePassword,
                            lableText: 'Password',
                            hintText: 'Enter your password',
                            isPassword: cubit.isPassword,
                            prefixIcon: 'assets/icons/Lock.svg',
                            onSuffixPressed: () {
                              cubit.changePasswordVisibalty();
                            },
                            suffixIcon: cubit.isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          SizedBox(
                            height: SizeConfigManger.bodyHeight * 0.03,
                          ),
                          CustomButton(
                            text: 'SIGN Up',
                            press: () {
                              boardController.nextPage(
                                  duration: const Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.fastLinearToSlowEaseIn);
                              SignUpCubit.get(context).incrementStep();
                            },
                          ),
                          SizedBox(
                            height: SizeConfigManger.bodyHeight * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Alreay have an account? ",
                                style: TextStyle(
                                    fontSize:
                                    getProportionateScreenWidth(16)),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Login Up",
                                  style: TextStyle(
                                      fontSize:
                                      getProportionateScreenWidth(18),
                                      color: ColorsManger.darkBlue),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfigManger.bodyHeight * 0.05,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    height: 1.5,
                                    color: Colors.grey,
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    getProportionateScreenHeight(15.0)),
                                child: AppText(
                                    text: 'OR',
                                    textSize: 22.0,
                                    color: ColorsManger.grey),
                              ),
                              Expanded(
                                  child: Container(
                                    height: 1.5,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfigManger.bodyHeight * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialCard(
                                icon: "assets/icons/google-icon.svg",
                                press: () {},
                              ),
                              SocialCard(
                                icon: "assets/icons/facebook-2.svg",
                                press: () {},
                              ),
                              SocialCard(
                                icon: "assets/icons/twitter.svg",
                                press: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
