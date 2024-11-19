import 'package:flutter/material.dart';

class SeatColorInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          colorInfoItem("선택됨", Theme.of(context).highlightColor),
          SizedBox(width: 20),
          colorInfoItem("선택안됨", Theme.of(context).cardColor),
        ],
      ),
    );
  }

  Row colorInfoItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
        ),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}
