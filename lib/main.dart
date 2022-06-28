import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/shared/helper/bloc_observer.dart';
import 'package:tour_app/shared/services/local/cache_helper.dart';
import 'package:tour_app/shared/services/network/dio_helper.dart';
import 'package:tour_app/shared/styles/styles.dart';
import 'package:tour_app/ui/screens/on_boarding/on_boarding_screen.dart';


void main() {
  BlocOverrides.runZoned(
    () async{
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init(); //make connection
      await CachedHelper.init(); // save local small data
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tour App',
      theme: ThemeManger.setLightTheme(),
      home:  OnBoardingScreen(),
    );
  }
}
