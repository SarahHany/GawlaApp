import 'package:flutter/material.dart';
import 'package:tour_app/model/interest_model.dart';
import 'package:tour_app/shared/helper/mangers/size_config.dart';

import 'custom_inter_card.dart';

class InterestSelect extends StatefulWidget {
  InterestModel model;
  final ValueChanged<bool> onSelect;

  InterestSelect({required this.model, required this.onSelect});

  @override
  State<InterestSelect> createState() => _InterestSelectState();
}

class _InterestSelectState extends State<InterestSelect> {
  bool isSelectd = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            isSelectd = !isSelectd;
            widget.onSelect(isSelectd);
          });
        },
        child: CustomInterestCard(
            isSelected: isSelectd,
            title: widget.model.title,
            prefix: widget.model.image));
  }
}
