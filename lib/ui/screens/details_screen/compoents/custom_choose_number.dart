import 'package:flutter/material.dart';

import '../../../../shared/helper/mangers/size_config.dart';
import '../../../widgets/app_text.dart';
class CustomRadioListTileNumber<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String number;
  final ValueChanged<T?> onChanged;

  const CustomRadioListTileNumber({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: getProportionateScreenHeight(50.0),
        child: _customRadioButton,
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : null,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: AppText(text: number,textSize: 25.0,fontWeight: FontWeight.bold),
    );
  }
}