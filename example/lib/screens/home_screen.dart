import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

import '../utils/constants.dart' as ex;
import '../widget/example_app_bar.dart';
import '../widget/example_list_item.dart';

class HomeScreen extends StatelessWidget with SpacingMixin {
  static const String routeName = '/'; //We used only '/' refer to this https://github.com/lukepighetti/fluro/issues/227#issuecomment-877117069
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    // String url = 'https://www.google.com';
    //String errorUrl = 'https://www.googleefefe.com';

    return Scaffold(
      appBar: ExampleAppBar(
        isHomeScreen: true,
        title: 'Core UI Widgets',
        buildContext: context,
      ),
      body: Padding(
        padding: p3,
        child: ListView.builder(
          itemCount: ex.Constants.widgetMap.keys.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            List<String> _titleList = <String>[];
            List<String> _routesList = <String>[];
            ex.Constants.widgetMap.keys.forEach((element) {
              _titleList.add(element);
            });
            ex.Constants.widgetMap.values.forEach((element) {
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _openWebView(url, context),
      //   tooltip: 'Open WebView',
      //   child: Icon(Icons.web_asset_rounded),
      // ),
    );
  }

  // ignore: unused_element
  void _openWebView(String url, BuildContext context) async {

  }
}
