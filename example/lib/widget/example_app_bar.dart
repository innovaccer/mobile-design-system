import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

PreferredSizeWidget ExampleAppBar({  String? title,
  bool? isHomeScreen = false,
  BuildContext? buildContext,}){
  return AppBar( // 111111
    title: isHomeScreen!
        ? Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(
              'asset/png/innovaccer_logo.png',
              height: 36,
              width: 36,
            ),
          ),
        ),
        SizedBox(
          width: 24,
        ),
        Flexible(
          child: MDSTitle(
            title!,
            type: TitleType.title3,
          ),
        ),
      ],
    )
        : MDSTitle(
      title!,
      type: TitleType.title3,
    ),
    centerTitle: true,
  );
}

