import 'package:example/utils/constants.dart';
import 'package:example/widget/example_app_bar.dart';
import 'package:example/widget/example_list_item.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class TypographyScreen extends StatelessWidget with SpacingMixin {
  static const String routeName = '/typography_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(
        isHomeScreen: false,
        title: 'Typography Widgets',
        buildContext: context,
      ),
      body: Padding(
        padding: p1,
        child: ListView.builder(
          itemCount: Constants.typographyWidgetMap.keys.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            List<String> _titleList = <String>[];
            List<String> _routesList = <String>[];
            Constants.typographyWidgetMap.keys.forEach((element) {
              _titleList.add(element);
            });
            Constants.typographyWidgetMap.values.forEach((element) {
              _routesList.add(element);
            });
            return Padding(
              padding: EdgeInsets.all(4.0),
              child: ExampleItem(
                title: (index + 1).toString() + '. ' + _titleList[index],
                routeName: _routesList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
