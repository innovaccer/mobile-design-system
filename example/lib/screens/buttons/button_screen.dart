import 'package:example/utils/constants.dart';
import 'package:example/widget/example_app_bar.dart';
import 'package:example/widget/example_list_item.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class ButtonScreen extends StatelessWidget with SpacingMixin {
  static const String routeName = '/button_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(
        isHomeScreen: false,
        title: 'Button Widgets',
        buildContext: context,
      ),
      body: Padding(
        padding: p3,
        child: ListView.builder(
          itemCount: Constants.buttonWidgetMap.keys.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            List<String> _titleList = <String>[];
            List<String> _routesList = <String>[];
            Constants.buttonWidgetMap.keys.forEach((element) {
              _titleList.add(element);
            });
            Constants.buttonWidgetMap.values.forEach((element) {
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
