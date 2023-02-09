import 'package:flutter/material.dart';
import 'package:izinto/utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  FontWeight weight;
  BigText(
      {Key? key,
      this.color = const Color(0xFF707070),
      required this.text,
      required this.weight,
      this.overFlow = TextOverflow.clip,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Hind',
        color: color,
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontWeight: weight,
      ),
    );
  }
}
