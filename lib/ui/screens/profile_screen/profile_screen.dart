import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tour_app/layout/cubit/main_cubit.dart';
import 'package:tour_app/shared/helper/icon_broken.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/methods.dart';
import 'package:tour_app/shared/services/local/cache_helper.dart';
import 'package:tour_app/ui/screens/login_screen/login_screen.dart';
import 'package:tour_app/ui/widgets/custom_button.dart';

import '../../../shared/helper/mangers/size_config.dart';
import '../../widgets/app_text.dart';
import '../profile_edit/profile_edit_screen.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        MainCubit cubit =MainCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: SizeConfigManger.bodyHeight * 0.4,
                    decoration: const BoxDecoration(
                        color: Colors.white
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: SizeConfigManger.bodyHeight*0.08,),
                            CircleAvatar(
                              radius: SizeConfigManger.bodyHeight * 0.08,
                              backgroundColor: ColorsManger.backgroundColor,
                              child: Container(
                                height: SizeConfigManger.bodyHeight * 0.08,
                                width: SizeConfigManger.bodyHeight * 0.08,
                                child: SvgPicture.asset('assets/icons/User.svg',
                                    fit: BoxFit.contain),
                              ),
                            ),
                            SizedBox(height: SizeConfigManger.bodyHeight*0.02,),
                            AppText(
                              text: 'Sarah Hassan',
                              textSize: 27,
                              color: ColorsManger.lightBlue,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfigManger.bodyHeight * 0.4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorsManger.backgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenHeight(15)),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              navigateTo(context, EditProfileScreen());
                            },
                            child: Container(
                              height: SizeConfigManger.bodyHeight*0.1,
                              width: double.infinity,
                              padding: EdgeInsets.all(getProportionateScreenHeight(20.0)),
                              child: Row(
                                children: [
                                  Icon(IconBroken.Edit),
                                  SizedBox(width: getProportionateScreenHeight(30.0),),
                                  AppText(text: 'Edit Profile',textSize: 20.0),
                                  Spacer(),
                                  Icon(IconBroken.Arrow___Right_2),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: SizeConfigManger.bodyHeight*0.06,),
                          Container(
                            height: SizeConfigManger.bodyHeight*0.1,
                            width: double.infinity,
                            padding: EdgeInsets.all(getProportionateScreenHeight(20.0)),
                            child: Row(
                              children: [
                                Icon(IconBroken.Notification),
                                SizedBox(width: getProportionateScreenHeight(30.0),),
                                AppText(text: 'Notification',textSize: 20.0),
                                Spacer(),
                                Icon(IconBroken.Arrow___Right_2),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfigManger.bodyHeight*0.06,),
                          Container(
                            height: SizeConfigManger.bodyHeight*0.1,
                            width: double.infinity,
                            padding: EdgeInsets.all(getProportionateScreenHeight(20.0)),
                            child: Row(
                              children: [
                                Icon(IconBroken.Info_Circle),
                                SizedBox(width: getProportionateScreenHeight(30.0),),
                                AppText(text: 'Support',textSize: 20.0),
                                Spacer(),
                                Icon(IconBroken.Arrow___Right_2),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfigManger.bodyHeight*0.06,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(50.0)),
                            child: CustomButton(text: 'Sign Out' , press: (){
                              //CachedHelper.clearData();
                              navigateToAndFinish(context,LoginScreen());
                            },),
                          ),

                        ],
                      ),
                    ),
                  )

                ],
              )),
        );
      },
    );
  }

  /*ImageProvider setImage(MainCubit cubit) {
    if ("${cubit.userModel!.image}" == ConstantsManger.DEFAULT) {
      return AssetImage('assets/images/user.png');
    } else {
      if (cubit.profileImage != null) {
        return FileImage(cubit.profileImage ?? File(''));
      } else {
        return NetworkImage(cubit.userModel!.image ?? '');
      }
    }
  }*/
}
