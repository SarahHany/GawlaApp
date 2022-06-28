import 'package:flutter/material.dart';
import 'package:tour_app/shared/helper/mangers/colors.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';

class ProfileEditBackground extends StatelessWidget {

  final Widget child;

  ProfileEditBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
       ClipPath(
           clipper: ClipperCustom(),
           child: Container(
             height: SizeConfigManger.bodyHeight*0.45,
             width: double.infinity,
             color: ColorsManger.darkBlue,
           )
       ),
        child
      ],
    );
  }
}

class ClipperCustom extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height-getProportionateScreenHeight(200.0));
    path.lineTo(size.width-SizeConfigManger.screenWidth*0.5, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width-SizeConfigManger.screenWidth*0.6, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}

