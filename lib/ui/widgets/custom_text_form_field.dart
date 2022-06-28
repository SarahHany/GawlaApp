import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../shared/helper/mangers/colors.dart';
import '../../shared/helper/mangers/size_config.dart';


class CustomTextFormField extends StatelessWidget {
  bool isPassword;
  TextInputType? type;
  dynamic onChange;
  dynamic validate;
  dynamic onTap;
  Color ? backgroundcolors;
  dynamic onSaved;
  dynamic onSuffixPressed;
  var controller;
  bool ? isEnabled;
  IconData ? suffixIcon;
  String ? lableText;
  String ? hintText;
  String? prefixIcon;
  int ? maxLine ;
  CustomTextFormField({this.isPassword = false,
    this.type = TextInputType.text,
    this.maxLine =1,
    this.onChange,
    this.validate,
    this.onTap,
    this.isEnabled = true,
    this.suffixIcon,
    this.backgroundcolors = const Color(0xffF1F1FB),
    this.onSuffixPressed,
    this.onSaved,
    this.controller,
    this.lableText,
    this.hintText,
    this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundcolors,
          borderRadius: BorderRadius.circular(
              getProportionateScreenHeight(20.0))
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword == true ? true : false,
        keyboardType: type,
        onChanged: onChange,
        onSaved: onSaved,
        maxLines: maxLine,
        validator: validate,
        onTap: onTap,
        enabled: isEnabled,
        decoration: InputDecoration(
          labelText: lableText,
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)

          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: IconButton(
            icon: Icon(suffixIcon), onPressed: onSuffixPressed,),
          prefixIcon: prefixIcon == null
              ? null
              : Padding(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              prefixIcon!,
              height: getProportionateScreenHeight(20.0),
              width: getProportionateScreenHeight(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
