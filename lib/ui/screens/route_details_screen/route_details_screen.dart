import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/model/TourModel.dart';
import 'package:tour_app/shared/helper/icon_broken.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/mangers/constants.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';
import 'package:tour_app/ui/screens/route_details_screen/cubit/route_cubit.dart';
import 'package:tour_app/ui/widgets/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

class RouteDetailsScreen extends StatelessWidget {
  TourModel tourModel;

  RouteDetailsScreen(this.tourModel);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouteCubit(),
      child: BlocConsumer<RouteCubit, RouteState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeConfigManger.bodyHeight * 0.35,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Align(
                            child: Container(
                              height: SizeConfigManger.bodyHeight * .315,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          tourModel.coverPhoto ?? ''),
                                      fit: BoxFit.cover)),
                            ),
                            alignment: AlignmentDirectional.topCenter,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: getProportionateScreenHeight(30.0)),
                            child: CircleAvatar(
                                radius: getProportionateScreenHeight(30.0),
                                child: IconButton(
                                    onPressed: () async {
                                  RouteCubit.get(context).playSound();
                                    },
                                    icon: Icon(RouteCubit.get(context).isPlaying ? Icons.pause:Icons.play_arrow))),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(getProportionateScreenHeight(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: '${tourModel.name}',
                            isTitle: true,
                            textSize: 30.0,
                            maxLines: 2,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15.0),
                          ),
                          AppText(
                            text: setUpDecrption(),
                            textSize: 20.0,
                            maxLines: 10,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10.0),
                          ),
                          AppText(
                            text: 'Read More',
                            textSize: 20.0,
                            maxLines: 1,
                            color: ColorsManger.darkBlue,
                            textDecoration: TextDecoration.underline,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(25.0),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenHeight(20.0)),
                            width: double.infinity,
                            height: getProportionateScreenHeight(1),
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(25.0),
                          ),
                          InkWell(
                            onTap: () async {
                              if (tourModel.id == 1) {
                                await openMap(
                                    lat: "29.980484", long: "31.133663");
                              }
                              if (tourModel.id == 2) {
                                await openMap(
                                    lat: "29.212144", long: "25.454079");
                              }
                              if (tourModel.id == 3) {
                                await openMap(
                                    lat: "28.196663", long: "30.756567");
                              }
                              if (tourModel.id == 4) {
                                await openMap(
                                    lat: "30.042282", long: "31.223644");
                              } else {
                                await openMap(
                                    lat: "30.047943", long: "31.262168");
                              }
                            },
                            child: Row(
                              children: [
                                Icon(IconBroken.Location),
                                SizedBox(
                                  width: getProportionateScreenHeight(8),
                                ),
                                AppText(
                                  text: 'Navigation',
                                  textSize: 23.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      end: getProportionateScreenHeight(20.0)),
                                  child: Icon(IconBroken.Arrow___Right_2),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(25.0),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenHeight(20.0)),
                            width: double.infinity,
                            height: getProportionateScreenHeight(1),
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15.0),
                          ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.camera),
                              SizedBox(
                                width: getProportionateScreenHeight(8),
                              ),
                              AppText(
                                text: 'Photos',
                                textSize: 23.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(15.0),
                          ),
                          Container(
                            height: SizeConfigManger.bodyHeight * 0.2,
                            width: double.infinity,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                  width: getProportionateScreenHeight(15.0)),
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return Center();
                                /*CustomPlaceCard(tourModel: TourModel(),)*/;
                              },
                              physics: BouncingScrollPhysics(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String setUpDecrption() {
    if (tourModel.id == 1) {
      return '${ConstantsManger.PyDesc}';
    } else if (tourModel.id == 2) {
      return '${ConstantsManger.SiwaDesc}';
    } else if (tourModel.id == 3) {
      return '${ConstantsManger.NiLeDesc}';
    } else if (tourModel.id == 4) {
      return '${ConstantsManger.OperaDesc}';
    } else {
      return ConstantsManger.KhanKalilDesc;
    }
  }

  Future<void> openMap({required String lat, required String long}) async {
    String mapUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat, $long';
    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      print('ad');
    }
  }
}
