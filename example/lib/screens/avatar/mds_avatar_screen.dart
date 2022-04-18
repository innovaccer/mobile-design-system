import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSAvatarScreen extends StatefulWidget {
  static const String routeName = '/mds_avatar_screen';

  @override
  _MDSAvatarScreenState createState() => _MDSAvatarScreenState();
}

class _MDSAvatarScreenState extends State<MDSAvatarScreen> with SpacingMixin, ColorMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSTitle(
          'Avatar',
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
              onTap: () {},
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
