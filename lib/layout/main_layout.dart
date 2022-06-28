import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/layout/cubit/main_cubit.dart';


class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     // get Current Phone size (width & height)
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItems,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: cubit.currentIndex,
              onTap: (int index){
                cubit.changeLayout(index);
              },
            ),
          );
        },
      ),
    );
  }


}
