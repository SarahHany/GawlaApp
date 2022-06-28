import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tour_app/model/TourModel.dart';
import 'package:tour_app/model/demo.dart';
import 'package:tour_app/shared/services/network/dio_helper.dart';

import '../../../../shared/helper/mangers/constants.dart';
import '../../../../shared/services/database_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<TourModel> listTours = [];

  void getAllTours() {
    emit(GetAllToursLoadingState());
    listTours.clear();
    DioHelper().getData(path: 'tours').then((value) {
      //  listTours.addAll(
      //      (value.data as List).map((e) => TourModel.fromJson(e)).toList());
      listTours.addAll(demo().list);
      emit(GetAllToursSucessState());
    }).catchError((error) {
      listTours.addAll(demo().list);
      emit(GetAllToursSucessState());
      if (error.response.statusCode == 502 || error.response.statusCode == 500 || error.response.statusCode == 400  ) {
        listTours.addAll(demo().list);
        emit(GetAllToursSucessState());
      }
      //  emit(GetAllToursErrorState(errorMsg: error.toString()));
    });
  }

  List<TourModel> listTourModel = [];

  void getAllToursFromDatabase() async {
    emit(GetAllDatabaseLoadingState());
    Database? database = await DatabaseHelper().database;
    listTourModel.clear();
    List m = await database!.rawQuery(ConstantsManger.GET_ALL_TOOURS);

    for (int i = 0; i < m.length; i++) {
      int id = int.parse(m[i]['idTour'].toString());

      for (int j = 0; j < demo().list.length; j++) {
        if (id == demo().list[j].id) {
          listTourModel.add(demo().list[j]);
        }
      }
      emit(GetAllDatabaseSuccessState());
    }
  }

  String? searchText;

  List<String> SearchList = [
    "Art","Religion","Historic","Fashion","Archeology"
  ];

  void chooseSearchItem(String cat) {
    this.searchText = cat;
    emit(ChooseSearchState());
  }
}