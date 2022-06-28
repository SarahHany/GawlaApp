import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta/meta.dart';
import 'package:tour_app/shared/helper/icon_broken.dart';
import 'package:tour_app/ui/screens/home_screen/home_screen.dart';
import 'package:tour_app/ui/screens/map_screen/map_screen.dart';
import 'package:tour_app/ui/screens/profile_screen/profile_screen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  
  static MainCubit get(context)=>BlocProvider.of(context);
  
  int currentIndex = 0;
  void changeLayout(int index){
    this.currentIndex = index;
    emit(ChangeIndexState());
  }
  
  List<Widget> screens=[
    HomeScreen(),MapScreen(),ProfileScreen()
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.explore),label: 'Exploer'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Location),label: 'Exploer'),
    BottomNavigationBarItem(icon: Icon(IconBroken.Profile),label: 'Exploer'),

  ];
}
