import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../shared/helper/mangers/constants.dart';
import '../../../../shared/services/local/cache_helper.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(BuildContext context) => BlocProvider.of(context);

  void checkUserState(context) {
    Future.delayed(Duration(seconds: 2), () {
      bool onBoarding =
          CachedHelper.getBooleon(key: ConstantsManger.ON_BOARDING) ?? false;
      if (onBoarding) {
        String isRemeber = CachedHelper.getString(key: ConstantsManger.TOKEN) ?? ConstantsManger.DEFULT;
        if (isRemeber != ConstantsManger.DEFULT) {
          emit(SplashMainLayoutState());
        } else {
          emit(SplashLoginState());
        }
      } else {
        emit(SplashOnBoardingState());
      }
    });
  }
}
