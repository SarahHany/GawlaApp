part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}
class ChooseNumberState extends DetailsState {}
class InsertDatabaseState extends DetailsState {}
