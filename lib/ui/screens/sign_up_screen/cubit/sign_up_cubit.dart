import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../model/interest_model.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(BuildContext context) => BlocProvider.of(context);
  bool isPassword = true;

  void changePasswordVisibalty() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibiltyState());
  }

  int currentStep = 0;

  void incrementStep() {
    if (currentStep < 2) {
      currentStep++;
    }
    emit(IncrementStepState());
  }

  int groupValue = 1;

  void changeRadioButtonState(value) {
    this.groupValue = value;
    emit(RadioButtonState());
  }


  int paymentValue = 1;

  void changePaymentState(value) {
    this.paymentValue = value;
    emit(PaymentState());
  }

  List<InterestModel> picked = [];
  void setUpList({required List<InterestModel> list}){
    list.forEach((element) {
      picked.add(element);
    });
   emit(SetUpReturn());
  }

}
