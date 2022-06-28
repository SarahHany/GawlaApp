import 'package:flutter/material.dart';

import '../../shared/helper/mangers/colors.dart';
import '../../shared/helper/mangers/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfigManger.screenWidth * 0.7,

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ColorsManger.darkBlue,width: 1)
      ),
      child: Row(
        children: [
          Icon(Icons.search),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search..',
                  focusedBorder: InputBorder.none),
              style: TextStyle(color: Colors.black),
              obscureText: false,
              keyboardType: TextInputType.text,
              onChanged: (String ? value){},
            ),
          ),
        ],
      )
    );
  }
}
