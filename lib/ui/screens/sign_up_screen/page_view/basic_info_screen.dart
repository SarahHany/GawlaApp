import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/ui/screens/interests_screen/interests_screen.dart';
import 'package:tour_app/ui/widgets/app_text.dart';
import 'package:tour_app/ui/widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../cubit/sign_up_cubit.dart';

class BasicInfoScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var fullName = TextEditingController();
  var emailController = TextEditingController();
  bool isMale = true;
  var boardController;

  BasicInfoScreen({required this.boardController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(20.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: getProportionateScreenHeight(20.0),
                  ),
                  CustomTextFormField(
                      controller: fullName,
                      hintText: 'Enter your full name',
                      lableText: 'Full Name',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'full name is required';
                        }
                      },
                      type: TextInputType.emailAddress,
                      prefixIcon: 'assets/icons/User.svg'),
                  SizedBox(
                    height: getProportionateScreenHeight(20.0),
                  ),
                  /*  CustomTextFormField(
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
                    height: getProportionateScreenHeight(30.0),
                  ),*/
                  Center(
                    child: AppText(text: "GENDER", fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                            value: 2,
                            groupValue: cubit.groupValue,
                            onChanged: (value) {
                              cubit.changeRadioButtonState(value);
                            }),
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(5.0),
                      ),
                      AppText(
                        text: 'Male',
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(50.0),
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Radio(
                            hoverColor: ColorsManger.darkBlue,
                            activeColor: ColorsManger.darkBlue,
                            value: 1,
                            groupValue: cubit.groupValue,
                            onChanged: (value) {
                              cubit.changeRadioButtonState(value);
                            }),
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(5.0),
                      ),
                      AppText(
                        text: 'Female',
                      )
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30.0),
                  ),
                  Center(
                    child: AppText(
                        text: "NATIONALITY", fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: getProportionateScreenHeight(70.0),
                    decoration: BoxDecoration(
                      color: ColorsManger.lightGrey,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: CountryListPick(
                      theme: CountryTheme(isShowCode: false),
                      useUiOverlay: true,
                      useSafeArea: false,
                      initialSelection: '+20',
                      onChanged: (code) {
                        print(code!.name);
                      },
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30.0),
                  ),
                  Center(
                    child: AppText(
                        text: "Phone Number", fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20.0),
                  ),
                  Container(
                    child: IntlPhoneField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                        FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        // phoneNumber.text = value.completeNumber;
                      },
                    ),
                  ),
                  Center(
                    child: AppText(
                        text: "Add Interests", fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InterestsScreen()))
                          .then((value) {
                        cubit.setUpList(list: value);
                      });
                    },
                    child: Container(
                      height: getProportionateScreenHeight(150),
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ColorsManger.black, width: 1),
                      ),
                      child: SignUpCubit.get(context).picked.length == 0
                          ? Center(child: AppText(text: "No Interesting Yet"))
                          : GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing:
                                  getProportionateScreenHeight(10.0),
                              mainAxisSpacing:
                                  getProportionateScreenHeight(10.0),
                              childAspectRatio: (140 / 40),
                              children: [
                                ...List.generate(
                                    SignUpCubit.get(context).picked.length,
                                    (index) => Container(
                                          height:
                                              SizeConfigManger.bodyHeight * 0.1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: ColorsManger.lightGrey),
                                          child: Center(
                                            child: AppText(
                                                textSize: 23,
                                                text: SignUpCubit.get(context)
                                                    .picked[index]
                                                    .title,
                                                color: Colors.black),
                                          ),
                                        ))
                              ],
                            ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30.0),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        activeColor: ColorsManger.darkBlue,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5.0),
                      ),
                      Center(
                        child: SizedBox(
                          width: SizeConfigManger.screenWidth * 0.7,
                          child: RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: 'I have read & accept ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'all the terms of policy and conditons',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20.0),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        activeColor: ColorsManger.darkBlue,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5.0),
                      ),
                      Center(
                        child: SizedBox(
                          width: SizeConfigManger.screenWidth * 0.7,
                          child: AppText(
                              maxLines: 2,
                              text:
                                  'I hereby myself to follow all the rules and regulations of Gawlah'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20.0),
                  ),
                  CustomButton(
                      text: 'SAVE & CONTINUE',
                      press: () {
                        boardController.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                        SignUpCubit.get(context).incrementStep();
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
