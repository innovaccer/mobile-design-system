import 'package:example/widget/example_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSLinkScreen extends StatefulWidget {
  static const String routeName = '/mds_link_screen';

  @override
  _MDSLinkScreenState createState() => _MDSLinkScreenState();
}

class _MDSLinkScreenState extends State<MDSLinkScreen> with SpacingMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(
        title: 'MDSLink',
        buildContext: context,
      ),
      body: Column(
        children: [
          Padding(
            padding: p6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MDSBody(
                  'This is a sample link: ',
                ),
                Flexible(
                  child: MDSLink(
                    'https://www.google.com',
                    textAlign: TextAlign.left,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
