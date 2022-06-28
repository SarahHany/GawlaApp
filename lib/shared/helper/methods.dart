import 'package:flutter/material.dart';
import 'mangers/colors.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateToAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

void navigateToWithAnimation(context, widget) {
  Navigator.push(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, _) {
            return FadeTransition(
              opacity: animation,
              child: widget,
            );
          }));
}


void showSnackBar(BuildContext context, String errorMsg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(errorMsg),
    backgroundColor: Colors.black,
    duration: Duration(seconds: 5),
  ));
}

void showCustomProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(ColorsManger.darkBlue),
      ),
    ),
  );

  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alertDialog;
    },
  );
}
