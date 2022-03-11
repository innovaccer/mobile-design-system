import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSPageHeaderWithOutSubHeadingScreen extends StatelessWidget {
  static const String routeName = '/without_subheading_page_header_screen';

  MDSPageHeaderWithOutSubHeadingScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MDSPageHeaderWithOutSubHeading(
      heading: 'Heading',
      actionButtonText: 'Action',
      controller: scrollController,
      body: MDSList(
        scrollController: scrollController,
        length: 100,
        itemBuilder: (listContext, index) {
          return GestureDetector(
            onTap: () {},
            child: MDSListItem(
              primaryText: '$index',
            ),
          );
        },
      ),
    );
  }
}
