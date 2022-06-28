import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tbib_toast/tbib_toast.dart';
import 'package:tour_app/layout/main_layout.dart';
import 'package:tour_app/model/TourModel.dart';
import 'package:tour_app/shared/helper/icon_broken.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/shared/helper/methods.dart';
import 'package:tour_app/ui/screens/details_screen/cubit/details_cubit.dart';
import 'package:tour_app/ui/screens/details_screen/test.dart';
import 'package:tour_app/ui/screens/home_screen/home_screen.dart';
import 'package:tour_app/ui/screens/rating_screen/rating_screen.dart';
import 'package:tour_app/ui/widgets/app_text.dart';
import 'package:tour_app/ui/widgets/custom_button.dart';

import '../route_details_screen/route_details_screen.dart';
import 'compoents/custom_choose_number.dart';

class DetailsScreen extends StatelessWidget {
  TourModel tourModel;
  bool isFromALlTours ;

  DetailsScreen({required this.tourModel , required this.isFromALlTours});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(),
      child: BlocConsumer<DetailsCubit, DetailsState>(
        listener: (context, state) {
          if(state is InsertDatabaseState){
            Toast.show("Booking Success", context,backgroundColor: Colors.green,duration: 3);
            navigateTo(context, MainLayout());
          }
        },
        builder: (context, state) {
          print(isFromALlTours);
          DetailsCubit cubit = DetailsCubit.get(context);
          return Scaffold(
            body: SafeArea(child: getBody(cubit, tourModel,isFromALlTours,context)),
            bottomNavigationBar: isFromALlTours ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(50.0)),
              child: InkWell(
                onTap: () {
                  cubit.insertIntoLocalDateBase(id: tourModel.id??1);
                },
                child: Container(
                  height: getProportionateScreenHeight(65.0),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenHeight(50.0)),
                  decoration: BoxDecoration(
                    color: ColorsManger.darkBlue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      AppText(
                          text: 'Book Tour Now',
                          color: Colors.white,
                          textSize: 20.0,
                          fontWeight: FontWeight.bold),
                      Spacer(),
                      Icon(IconBroken.Arrow___Right_2, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ) : null,
          );
        },
      ),
    );
  }

  Widget getBody(DetailsCubit cubit, TourModel tourModel,bool isFromALlTours , context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: SizeConfigManger.bodyHeight * 0.35,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("${tourModel.coverPhoto}"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SizeConfigManger.bodyHeight * 0.3),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: getProportionateScreenHeight(30.0)),
                        child: AppText(
                          text: '${tourModel.name}',
                          textSize: 24,
                          fontWeight: FontWeight.bold,
                          isTitle: true,
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(20.0),
                      ),
                      isFromALlTours ? AppText(
                          text: '${tourModel.cost} \$',
                          color: ColorsManger.lightBlue) : Center(),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        AppText(
                          text: "Category : ",
                          textSize: 20,
                          color: ColorsManger.grey,
                        ),
                        SizedBox(width: getProportionateScreenHeight(5)),
                        AppText(text: "Religion",color: Colors.black,textSize:22 ,)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: getProportionateScreenHeight(30.0)),
                        child: Icon(IconBroken.Location),
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(15.0),
                      ),
                      AppText(
                          text: '${tourModel.location}',
                          color: ColorsManger.darkBlue),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  isFromALlTours ?  Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: getProportionateScreenHeight(30.0)),
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemBuilder: (context, _) =>
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 5.0,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(15.0),
                      ),
                      AppText(
                          text: '${tourModel.visitorsJoined}',
                          textSize: 17,
                          color: ColorsManger.lightBlue),
                      SizedBox(
                        width: getProportionateScreenHeight(15.0),
                      ),
                      AppText(
                          text: 'Show Reviews',
                          textSize: 16,
                          color: ColorsManger.lightBlue),
                    ],
                  )  : Center(),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  isFromALlTours ? Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: getProportionateScreenHeight(50.0)),
                    child: AppText(
                      text: 'People',
                      textSize: 24,
                      fontWeight: FontWeight.bold,
                      isTitle: true,
                    ),
                  ) :Center(),
                  isFromALlTours ?   SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ) : Center(),
                  isFromALlTours ? Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: getProportionateScreenHeight(30.0)),
                    child: AppText(
                        text: 'Number of people in your group',
                        textSize: 17,
                        color: ColorsManger.darkBlue),
                  ):Center(),
                  isFromALlTours ? SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ):Center(),
                  isFromALlTours ? Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: getProportionateScreenHeight(30.0)),
                    child: Row(
                      children: [
                        CustomRadioListTileNumber<int>(
                          value: 1,
                          groupValue: cubit.value,
                          number: '1',
                          onChanged: (value) {
                            cubit.chooseNumber(value!);
                          },
                        ),
                        SizedBox(
                          width: getProportionateScreenHeight(20.0),
                        ),
                        CustomRadioListTileNumber<int>(
                          value: 2,
                          groupValue: cubit.value,
                          number: '2',
                          onChanged: (value) {
                            cubit.chooseNumber(value!);
                          },
                        ),
                        SizedBox(
                          width: getProportionateScreenHeight(20.0),
                        ),
                        CustomRadioListTileNumber<int>(
                          value: 3,
                          groupValue: cubit.value,
                          number: '3',
                          onChanged: (value) {
                            cubit.chooseNumber(value!);
                          },
                        ),
                        SizedBox(
                          width: getProportionateScreenHeight(20.0),
                        ),
                        CustomRadioListTileNumber<int>(
                          value: 4,
                          groupValue: cubit.value,
                          number: '4',
                          onChanged: (value) {
                            cubit.chooseNumber(value!);
                          },
                        ),
                        SizedBox(
                          width: getProportionateScreenHeight(20.0),
                        ),
                        CustomRadioListTileNumber<int>(
                          value: 5,
                          groupValue: cubit.value,
                          number: '5',
                          onChanged: (value) {
                            cubit.chooseNumber(value!);
                          },
                        ),
                        /* buildCardNumber(number: '1'),
                        SizedBox(
                          width: getProportionateScreenHeight(20),
                        ),
                        buildCardNumber(number: '2'),
                        SizedBox(
                          width: getProportionateScreenHeight(15),
                        ),
                        buildCardNumber(number: '3'),
                        SizedBox(
                          width: getProportionateScreenHeight(15),
                        ),
                        buildCardNumber(number: '4'),
                        SizedBox(
                          width: getProportionateScreenHeight(15),
                        ),
                        buildCardNumber(number: '5'),*/
                      ],
                    ),
                  ) : Center(),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: getProportionateScreenHeight(50.0)),
                    child: AppText(
                      text: 'Description',
                      textSize: 24,
                      fontWeight: FontWeight.bold,
                      isTitle: true,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: getProportionateScreenHeight(30.0)),
                    child: AppText(
                        text: '${tourModel.description}',
                        textSize: 17,
                        maxLines: 2,
                        color: ColorsManger.darkBlue),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: getProportionateScreenHeight(50.0)),
                    child: AppText(
                      text: 'Routes',
                      textSize: 24,
                      fontWeight: FontWeight.bold,
                      isTitle: true,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  Container(
                    height: SizeConfigManger.bodyHeight * 0.2,
                    width: double.infinity,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(width: getProportionateScreenHeight(15.0)),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return CustomPlaceCardTest(() {
                          navigateTo(context, RouteDetailsScreen(tourModel));
                        });
                      },
                      physics: BouncingScrollPhysics(),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15.0),
                  ),
                  isFromALlTours ?  Row(
                    children: [
                      CircleAvatar(
                        radius: SizeConfigManger.bodyHeight * 0.04,
                        backgroundColor: Colors.white,
                        child: Container(
                            height: SizeConfigManger.bodyHeight * 0.05,
                            width: SizeConfigManger.bodyHeight * 0.05,
                            child: tourModel.tourCreator!.photo == "user"
                                ? SvgPicture.asset('assets/icons/User.svg') : Image.network('${tourModel.tourCreator!.photo}', fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenHeight(5.0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text:
                              '${tourModel.tourCreator!.firstName} ${tourModel
                                  .tourCreator!.lastName}',
                              color: ColorsManger.darkBlue),
                          Row(
                            children: [
                              AppText(
                                  text: '${tourModel.tourCreator!.phone}',
                                  color: ColorsManger.black,
                                  textSize: 14),
                              SizedBox(
                                width: getProportionateScreenHeight(5),
                              ),
                              Icon(IconBroken.Call),
                            ],
                          ),
                          Row(
                            children: [
                              AppText(
                                  text: 'Rating: ',
                                  color: ColorsManger.lightBlue,
                                  textSize: 14),
                              AppText(
                                  text: '3.1',
                                  color: ColorsManger.black,
                                  textSize: 14),
                              SizedBox(
                                width: getProportionateScreenHeight(15.0),
                              ),
                              AppText(
                                  text: 'tours completed: ',
                                  color: ColorsManger.lightBlue,
                                  textSize: 14),
                              AppText(
                                  text: '24',
                                  color: ColorsManger.black,
                                  textSize: 14),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ) : Center(),
                  isFromALlTours? Center():CustomButton(press: (){
                    navigateTo(context, RatingScreen());
                  },text: "Rate This Tour"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
