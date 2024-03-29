import 'package:flutter/material.dart';
import 'package:multitask/text_style.dart';

List<Text> days = [
    Text('ПН', style: smallTextStyle()),
    Text('ВТ', style: smallTextStyle()),
    Text('СР', style: smallTextStyle()),
    Text('ЧТ', style: smallTextStyle()),
    Text('ПТ', style: smallTextStyle()),
    Text('СБ', style: redSmallTextStyle()),
    Text('ВС', style: redSmallTextStyle()),
];

class DayBuilder extends StatelessWidget {
  const DayBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        //padding: const EdgeInsets.only(top: 10),
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 14),
            child: days[index]
          );
        }
      )
    );
  }
}