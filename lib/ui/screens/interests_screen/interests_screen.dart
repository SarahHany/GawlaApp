import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/shared/helper/icon_broken.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/model/interest_model.dart';
import 'package:tour_app/shared/helper/methods.dart';
import 'package:tour_app/ui/screens/interests_screen/cubit/inter_cubit.dart';
import 'package:tour_app/ui/screens/interests_screen/components/select_inter.dart';
import 'package:tour_app/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:tour_app/ui/widgets/app_text.dart';
import 'package:tour_app/ui/widgets/custom_button.dart';

import '../../../shared/helper/mangers/size_config.dart';

class InterestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InterCubit(),
      child: BlocConsumer<InterCubit, InterState>(
        listener: (context, state) {},
        builder: (context, state) {
          InterCubit cubit = InterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorsManger.lightGrey,
              leading: IconButton(
                  onPressed: () {}, icon: Icon(IconBroken.Arrow___Left)),
              centerTitle: true,
              title: AppText(text: 'Choose Interests', textSize: 20.0),
            ),
            body: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: getProportionateScreenHeight(10.0),
                      mainAxisSpacing: getProportionateScreenHeight(10.0),
                      childAspectRatio: (140 / 40),
                      children: [
                        ...List.generate(
                            InterestModel.interestList.length,
                            (index) => Container(
                                  height: SizeConfigManger.bodyHeight * 0.1,
                                  child: InterestSelect(
                                    model: InterestModel.interestList[index],
                                    onSelect: (value) {
                                      if (value) {
                                        cubit.addItemToInterestList(
                                            InterestModel.interestList[index]);
                                      } else {
                                        cubit.removeItemFromInterestList(
                                            InterestModel.interestList[index]);
                                      }
                                    },
                                  ),
                                ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50,left: 15,right: 15),
                    child: CustomButton(press: (){
                      Navigator.of(context).pop(cubit.picked.toList());
                    },text: "Confirm",),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
