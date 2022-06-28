import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:tour_app/layout/cubit/main_cubit.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/shared/helper/methods.dart';
import 'package:tour_app/ui/screens/login_screen/cubit/login_cubit.dart';
import 'package:tour_app/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:tour_app/ui/widgets/custom_button.dart';
import 'package:tour_app/ui/widgets/custom_text_form_field.dart';
import '../../../layout/main_layout.dart';
import 'components/background.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginLoadingState){
            showCustomProgressIndicator(context);
          }else if(state is LoginSuccessState){
            Navigator.pop(context);
            Toast.show("Welcome", context,duration: 3,backgroundColor: Colors.green);
            navigateToAndFinish(context, MainLayout());
          }else if (state is LoginFailedState){
            Navigator.pop(context);
            Toast.show(state.error, context,duration: 3,backgroundColor: Colors.red);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Background(
              isWelcome: true,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/sign_in.png',
                          height: SizeConfigManger.bodyHeight * 0.35,
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
                              Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    activeColor: ColorsManger.darkBlue,
                                    onChanged: (value) {},
                                  ),
                                  Text("Remember me"),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: SizeConfigManger.bodyHeight * 0.03,
                              ),
                              CustomButton(
                                text: 'LOGIN',
                                press: () {
                                  navigateToAndFinish(context, MainLayout());
                                  /*if (formKey.currentState!.validate()) {
                                    cubit.signInUser(iden: emailController.text, password: passwordController.text);
                                  }*/
                                },
                              ),
                              SizedBox(
                                height: SizeConfigManger.bodyHeight * 0.05,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don’t have an account? ",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(16)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      navigateTo(context, SignUpScreen());
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(18),
                                          color: ColorsManger.darkBlue),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
