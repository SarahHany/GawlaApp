import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../shared/helper/mangers/constants.dart';
import '../../../../shared/services/database_helper.dart';
part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  static DetailsCubit get(context)=>BlocProvider.of(context);

  int value=1;
  void chooseNumber(int value){
    this.value = value;
    emit(ChooseNumberState());
  }
  void insertIntoLocalDateBase({required int id}) async {
    String idString ="$id";
    Database? _database = await DatabaseHelper().database;
    await _database!.transaction((txn) async {
      await txn
          .rawInsert(
          'INSERT INTO ${ConstantsManger.TABLE_NAME} (idTour) VALUES ("${idString}")')
          .then((value) {
        print("$value inserted successfully");
        emit(InsertDatabaseState());
      }).catchError((error) {
        print('Error Insert ${error.toString()}');
      });
    });
  }

}
