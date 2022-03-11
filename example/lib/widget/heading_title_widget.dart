import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class HeadingTitle extends StatelessWidget {
  final String? title;

  HeadingTitle({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: MDSBody(
        title!,
        appearance: BodyAppearance.medium,
      ),
    );
  }
}
