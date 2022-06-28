part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class ChangePasswordVisibiltyState extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {}
class LoginFailedState extends LoginState {
  String error;

  LoginFailedState(this.error);
}
