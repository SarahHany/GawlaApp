import 'package:flutter/material.dart';
import '../../../../shared/helper/mangers/size_config.dart';

class Background extends StatelessWidget {
  final Widget child;
  bool isWelcome;


  Background({required this.child , required this.isWelcome});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          isWelcome? Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.35,
            ),
          ):Container(),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: size.width * 0.4,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/images/welcome3.png',
              width: SizeConfigManger.bodyHeight*0.15,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
