import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/layout/main_layout.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/shared/helper/methods.dart';
import 'package:tour_app/ui/screens/home_screen/home_screen.dart';
import 'package:tour_app/ui/screens/profile_screen/profile_screen.dart';
import 'package:tour_app/ui/screens/recommended_screen/recommended_screen.dart';
import 'package:tour_app/ui/screens/sign_up_screen/cubit/sign_up_cubit.dart';
import 'package:tour_app/ui/widgets/app_text.dart';
import 'package:tour_app/ui/widgets/custom_button.dart';

import '../../../widgets/custom_text_form_field.dart';
import '../components/custom_payment_design.dart';

class PaymentScreen extends StatelessWidget {
  var name = TextEditingController();
  var number = TextEditingController();
  var expire = TextEditingController();
  var cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenHeight(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenHeight(100.0)),
                  child: Image.asset('assets/images/welcome3.png',
                      height: getProportionateScreenHeight(170),
                      width: getProportionateScreenHeight(170)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20.0),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenHeight(30.0)),
                  child: AppText(
                    text:
                        'Please enter your payment method for further registration',
                    textSize: 20.0,
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20.0),
                ),
                Row(
                  children: [
                    AppText(
                        text: 'Payment Method', isTitle: true, textSize: 23.0),
                    SizedBox(
                      width: getProportionateScreenHeight(10.0),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MyRadioListTile<int>(
                                value: 1,
                                groupValue: cubit.paymentValue,
                                leading: 'assets/icons/visa.png',
                                onChanged: (value) {
                                  cubit.changePaymentState(value);
                                },
                              ),
                              SizedBox(
                                width: getProportionateScreenHeight(10.0),
                              ),
                              MyRadioListTile<int>(
                                value: 2,
                                groupValue: cubit.paymentValue,
                                leading: 'assets/icons/mastercard-2.png',
                                onChanged: (value) {                                  cubit.changePaymentState(value);
                                cubit.changePaymentState(value);

                                },
                              ),
                              SizedBox(
                                width: getProportionateScreenHeight(10.0),
                              ),
                              MyRadioListTile<int>(
                                value: 3,
                                groupValue: cubit.paymentValue,
                                leading: 'assets/icons/paypal.png',
                                onChanged: (value) {
                                  cubit.changePaymentState(value);

                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(20.0),
                          ),
                          Row(
                            children: [
                              MyRadioListTile<int>(
                                value: 4,
                                groupValue: cubit.paymentValue,
                                leading: 'assets/icons/google-pay.png',
                                onChanged: (value) {
                                  cubit.changePaymentState(value);

                                },
                              ),
                              SizedBox(
                                width: getProportionateScreenHeight(10.0),
                              ),
                              MyRadioListTile<int>(
                                value: 5,
                                groupValue: cubit.paymentValue,
                                leading: 'assets/icons/apple-pay.png',
                                onChanged: (value) {
                                  cubit.changePaymentState(value);

                                },
                              ),
                              SizedBox(
                                width: getProportionateScreenHeight(10.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20.0),
                ),
                CustomTextFormField(
                  controller: name,
                  hintText: 'Name on Card*',
                  lableText: 'Name',
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Name on Card is required';
                    }
                  },
                  type: TextInputType.text,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20.0),
                ),
                CustomTextFormField(
                  controller: number,
                  hintText: 'Card Number*',
                  lableText: 'Number',
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Card Number is required';
                    }
                  },
                  type: TextInputType.number,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20.0),
                ),
                Row(
                  children: [
                    Container(
                      width: SizeConfigManger.screenWidth * 0.42,
                      child: CustomTextFormField(
                        controller: expire,
                        hintText: 'Expiry Date*',
                        lableText: 'Expiry Date',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Expiry Date is required';
                          }
                        },
                        type: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenHeight(20.0),
                    ),
                    Container(
                      width: SizeConfigManger.screenWidth * 0.42,
                      child: CustomTextFormField(
                        controller: cvv,
                        hintText: 'cvv',
                        lableText: 'cvv',
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'cvv is required';
                          }
                        },
                        type: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40.0),
                ),
                CustomButton(
                  text: 'PAY & CONTINUE',
                  press: () {
                    navigateTo(context, RecommendedScreen());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
