import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MDSBasicPageHeaderScreen extends StatelessWidget {
  static const String routeName = '/basic_page_header_screen';

  MDSBasicPageHeaderScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MDSBasicPageHeader(
      heading: 'Heading',
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
