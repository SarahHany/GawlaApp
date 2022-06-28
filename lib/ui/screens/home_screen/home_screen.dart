import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tour_app/ui/widgets/search_field.dart';
import 'package:tour_app/shared/helper/methods.dart';
import 'package:tour_app/ui/screens/home_screen/cubit/home_cubit.dart';
import 'package:tour_app/ui/screens/home_screen/page_view/alltours.dart';
import 'package:tour_app/ui/screens/home_screen/page_view/mytours.dart';
import 'package:tour_app/ui/screens/rating_screen/rating_screen.dart';

import '../../../shared/helper/mangers/size_config.dart';
import '../../widgets/app_text.dart';
import '../../widgets/item_search.dart';
import '../profile_edit/profile_edit_screen.dart';

class HomeScreen extends StatelessWidget {
  var boardController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllTours()..getAllToursFromDatabase(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(SizeConfigManger.bodyHeight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfigManger.bodyHeight * 0.01),
                    child: Row(
                      children: [
                        Expanded(child: DropDownItemSearch()),
                        SizedBox(width: 15),
                        InkWell(
                          onTap: (){
                            navigateTo(context, EditProfileScreen());
                          },
                          child: CircleAvatar(
                            radius: SizeConfigManger.bodyHeight * 0.04,
                            backgroundColor: Colors.white,
                            child: Container(
                              height: SizeConfigManger.bodyHeight * 0.05,
                              width: SizeConfigManger.bodyHeight * 0.05,
                              child: SvgPicture.asset('assets/icons/User.svg',
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfigManger.bodyHeight * 0.02),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: getProportionateScreenHeight(20)),
                    child: AppText(
                      text: 'Tours',
                      textSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10.0)),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: getProportionateScreenHeight(20)),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              boardController.animateToPage(0,
                                  duration: Duration(milliseconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                            child: AppText(
                              text: 'My Tours',
                              textSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(width: getProportionateScreenHeight(40.0)),
                        InkWell(
                          onTap: () {
                            if (boardController.page != 2) {
                              boardController.animateToPage(2,
                                  duration: Duration(milliseconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }
                          },
                          child: AppText(
                            text: 'All Tours',
                            textSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfigManger.bodyHeight * 0.02),
                  Expanded(
                    child: PageView(
                      controller: boardController,
                      physics: BouncingScrollPhysics(),
                      children: [
                        MyTours(),
                        AllTours(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
