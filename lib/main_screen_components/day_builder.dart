import 'package:flutter/material.dart';
import 'package:multitask/text_style.dart';



class DayBuilder extends StatelessWidget {
  const DayBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<Text> days = [
    Text('ПН', style: smallTextStyle(context)),
    Text('ВТ', style: smallTextStyle(context)),
    Text('СР', style: smallTextStyle(context)),
    Text('ЧТ', style: smallTextStyle(context)),
    Text('ПТ', style: smallTextStyle(context)),
    Text('СБ', style: redSmallTextStyle(context)),
    Text('ВС', style: redSmallTextStyle(context)),
];
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