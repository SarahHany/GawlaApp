part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}


class GetAllToursLoadingState extends HomeState {}
class GetAllToursSucessState extends HomeState {}
class GetAllToursErrorState extends HomeState {
  String errorMsg;
  GetAllToursErrorState({required this.errorMsg});

}

class GetAllDatabaseLoadingState extends HomeState {}
class GetAllDatabaseSuccessState extends HomeState {}
class ChooseSearchState extends HomeState {}
