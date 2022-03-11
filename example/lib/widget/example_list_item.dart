import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class ExampleItem extends StatelessWidget {
  final String? title;
  final String? routeName;

  ExampleItem({
    required this.title,
    this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (routeName != null) {
          Navigator.pushNamed(context, routeName!);
        }
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MDSBody(
            title!,
          ),
        ),
      ),
    );
  }
}
