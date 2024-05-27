import 'package:flutter/material.dart';
import 'package:multitask/see_all_components/see_all_builder.dart';


class SeeAllScreen extends StatelessWidget {

  final int index;

  const SeeAllScreen({super.key, required this.index});



  @override
  Widget build(BuildContext context) { return SeeAllBuilder(index: index); }
}