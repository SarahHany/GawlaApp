import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tour_app/ui/screens/home_screen/cubit/home_cubit.dart';
import '../../../../../shared/helper/mangers/size_config.dart';

class DropDownItemSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2(
            buttonPadding: EdgeInsets.symmetric(horizontal: 10),
            buttonDecoration: BoxDecoration(
                border: Border.all(color: Colors.grey,),
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            hint: Text(
              'Search ....',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(20.0),
                color: Theme.of(context).hintColor,
              ),
            ),
            items: HomeCubit.get(context).SearchList
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(20.0),
                        ),
                      ),
                    ))
                .toList(),
            value: HomeCubit.get(context).searchText,
            onChanged: (value) {
              HomeCubit.get(context).chooseSearchItem(value as String);
            },
            buttonHeight: getProportionateScreenHeight(50.0),
            buttonWidth: double.infinity,
            itemHeight: getProportionateScreenHeight(50.0),
          ),
        );
      },
    );
  }
}
