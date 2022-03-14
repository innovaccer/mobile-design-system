import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSActionSheetScreen extends StatefulWidget {
  static const String routeName = '/mds_action_sheet_screen';

  @override
  _MDSActionSheetScreenState createState() => _MDSActionSheetScreenState();
}

class _MDSActionSheetScreenState extends State<MDSActionSheetScreen>
    with SpacingMixin, ColorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSTitle(
          'Action Sheet',
          type: TitleType.title3,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            MDSButton(
              type: ButtonType.primary,
              title: 'Open sample action sheet 1',
              onTap: openActionSheet1,
            ),
            SizedBox(
              height: 16,
            ),
            MDSButton(
              type: ButtonType.primary,
              title: 'Open sample action sheet 2',
              onTap: openActionSheet2,
            ),
            SizedBox(
              height: 16,
            ),
            MDSButton(
              type: ButtonType.primary,
              title: 'Open sample action sheet 3',
              onTap: openActionSheet3,
            ),
          ],
        ),
      ),
    );
  }

  void openActionSheet1() async {
    await MDSActionSheet().open(
      context: context,
      heading: 'Noah Mellon',
      listOfOptions: [
        MDSActionSheetElement(
          onTap: () {},
          prefixIcon: Icons.video_call_outlined,
          primaryText: 'Request virtual visit',
        ),
        MDSActionSheetElement(
          onTap: () {},
          prefixIcon: Icons.history_outlined,
          primaryText: 'View conversation history',
        ),
      ],
    );
  }

  void openActionSheet2() async {
    await MDSActionSheet().open(
      context: context,
      heading: 'More options',
      listOfOptions: [
        MDSActionSheetElement(
          onTap: () {},
          prefixIcon: Icons.person_remove_alt_1_outlined,
          primaryText: 'Mark as inactive',
          secondaryText: 'User won\'t be able to access the app',
        ),
        MDSActionSheetElement(
          onTap: () {},
          prefixIcon: Icons.lock_outlined,
          primaryText: 'Update user permissions',
          secondaryText: 'Define what user can access',
        ),
      ],
    );
  }

  void openActionSheet3() async {
    await MDSActionSheet().open(
      context: context,
      heading: 'Sheet Title',
      listOfOptions: List<MDSActionSheetElement>.generate(
        100,
        (index) => MDSActionSheetElement(
          onTap: () {},
          prefixIcon: Icons.history_outlined,
          primaryText: 'Option $index',
        ),
      ),
    );
  }
}
