part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}
class ChangePasswordVisibiltyState extends SignUpState {}
class IncrementStepState extends SignUpState {}
class RadioButtonState extends SignUpState {}
class PaymentState extends SignUpState {}
class GetAllDatabaseLoadingState extends SignUpState {}
class GetAllDatabaseSuccessState extends SignUpState {}
class SetUpReturn extends SignUpState {}
