import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 2.0,
        color: Theme.of(context).primaryColor,
        width: MediaQuery.of(context).size.width * 0.9,
      ),
    );
  }
}
