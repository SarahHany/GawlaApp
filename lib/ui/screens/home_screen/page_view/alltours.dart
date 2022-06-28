import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/model/TourModel.dart';
import 'package:tour_app/shared/helper/icon_broken.dart';
import 'package:tour_app/ui/screens/home_screen/componets/custom_place_card.dart';
import 'package:tour_app/ui/screens/home_screen/cubit/home_cubit.dart';
import 'package:tour_app/ui/widgets/app_text.dart';
import '../../../../model/demo.dart';
import '../../../../shared/helper/mangers/size_config.dart';

class AllTours extends StatelessWidget {
  const AllTours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<TourModel> myList =HomeCubit.get(context).listTours.reversed.toList();
        return state is GetAllToursLoadingState
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: SizeConfigManger.bodyHeight * 0.3,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(width: getProportionateScreenHeight(15.0)),
                      scrollDirection: Axis.horizontal,
                      itemCount: HomeCubit.get(context).listTours.length,
                      itemBuilder: (context, index) {
                        return CustomPlaceCard(
                          tourModel: HomeCubit.get(context).listTours[index],
                        );
                      },
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: getProportionateScreenHeight(10.0),
                          right: getProportionateScreenHeight(10.0)),
                      alignment: AlignmentDirectional.topEnd,
                      child: AppText(text: 'See more')),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: getProportionateScreenHeight(20)),
                    child: AppText(
                      text: 'Explore More',
                      textSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: SizeConfigManger.bodyHeight * 0.3,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(width: getProportionateScreenHeight(15.0)),
                      scrollDirection: Axis.horizontal,
                      itemCount: HomeCubit.get(context).listTours.length,
                      itemBuilder: (context, index) {
                        return CustomPlaceCard(
                          tourModel: HomeCubit.get(context).listTours[index],
                        );
                      },
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                ],
              );
      },
    );
  }
}
