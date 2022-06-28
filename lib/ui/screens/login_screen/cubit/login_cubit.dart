import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tour_app/shared/helper/mangers/constants.dart';
import 'package:tour_app/shared/services/local/cache_helper.dart';

import '../../../../shared/services/network/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get (BuildContext context) => BlocProvider.of(context);

  bool isPassword = true;

  void changePasswordVisibalty() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibiltyState());
  }

void signInUser({required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper().postData(
        path: "api/auth/local",
        data: {"email": email, "password": password}).then((value) {
      if (value.statusCode == 200) {
        CachedHelper.saveData(key: ConstantsManger.TOKEN, value: value);
        emit(LoginSuccessState());
      }
    }).catchError((error) {
      emit(LoginFailedState(error.toString()));
    });
  }
}
