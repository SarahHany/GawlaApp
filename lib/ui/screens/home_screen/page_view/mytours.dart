import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/shared/helper/methods.dart';
import 'package:tour_app/ui/screens/details_screen/details_screen.dart';
import 'package:tour_app/ui/screens/home_screen/cubit/home_cubit.dart';
import 'package:tour_app/ui/screens/route_details_screen/route_details_screen.dart';
import 'package:tour_app/ui/widgets/app_text.dart';
import '../componets/custom_tour_design.dart';

class MyTours extends StatelessWidget {
  const MyTours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is GetAllDatabaseLoadingState
            ? Center(
                child: CircularProgressIndicator(),
              )
            : HomeCubit.get(context).listTourModel.length == 0
                ? Center(
                  child: AppText(
                      text: "No Tours yet", color: Colors.grey, textSize: 40,fontWeight: FontWeight.w600,),
                )
                : ListView.builder(
                    itemCount: HomeCubit.get(context).listTourModel.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          //RouteDetailsScreen(HomeCubit.get(context).listTourModel[index]
                          navigateTo(context, DetailsScreen(tourModel: HomeCubit.get(context).listTourModel[index], isFromALlTours: false));
                        },
                        child: CustomTourDesign(
                          HomeCubit.get(context).listTourModel[index]),
                      );
                    });
      },
    );
    ;
  }
}
