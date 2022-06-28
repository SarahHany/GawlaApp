part of 'inter_cubit.dart';

@immutable
abstract class InterState {}

class InterInitial extends InterState {}
class InsertDatabaseState extends InterState {}
class AddItemToListState extends InterState {}
class RemoveItemFromListState extends InterState {}
