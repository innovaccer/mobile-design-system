import 'package:example/utils/constants.dart';
import 'package:example/widget/example_app_bar.dart';
import 'package:example/widget/example_list_item.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';


class PageHeadersScreen extends StatefulWidget {
  static const String routeName = '/page_header_screen';

  const PageHeadersScreen({Key? key}) : super(key: key);

  @override
  State<PageHeadersScreen> createState() => _PageHeadersScreenState();
}

class _PageHeadersScreenState extends State<PageHeadersScreen> with SpacingMixin {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(
        isHomeScreen: false,
        title: 'Page Header Widgets',
        buildContext: context,
      ),
      body: Padding(
        padding: p3,
        child: ListView.builder(
          itemCount: Constants.pageHeaderWidgetMap.keys.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            List<String> _titleList = <String>[];
            List<String> _routesList = <String>[];
            Constants.pageHeaderWidgetMap.keys.forEach((element) {
              _titleList.add(element);
            });
            Constants.pageHeaderWidgetMap.values.forEach((element) {
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
