import 'package:doom_fire/app/modules/shared/utils/style.dart';
import 'package:flutter/material.dart';

class Pixel extends StatelessWidget {
  int value;
  Pixel({Key? key,required this.value}) : super(key: key);
  ConstStyle constStyle = ConstStyle();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
       color: constStyle.palette[value],
       border: Border.all(color: constStyle.palette[value])
      ),
    );
  }
}
