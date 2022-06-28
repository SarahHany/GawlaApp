import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../model/interest_model.dart';
import '../../../../shared/helper/mangers/constants.dart';

part 'inter_state.dart';

class InterCubit extends Cubit<InterState> {
  InterCubit() : super(InterInitial());

  static InterCubit get(context) => BlocProvider.of(context);
  List<InterestModel> picked = [];

  void addItemToInterestList(item){
    this.picked.add(item);
    emit(AddItemToListState());
  }

  void removeItemFromInterestList(item){
    this.picked.add(item);
    emit(RemoveItemFromListState());
  }


}
