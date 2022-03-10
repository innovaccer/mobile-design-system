import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class MDSCompactPageHeaderScreen extends StatelessWidget {
  static const String routeName = '/compact_page_header_screen';

  const MDSCompactPageHeaderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MDSCompactPageHeader(
      heading: 'Heading',
      listOfActionIcons: [
        MDSIconButton(
          type: IconButtonType.transparent,
          onTap: () {
            print('tapped');
          },
          icon: Icons.save_outlined,
        ),
        MDSIconButton(
          type: IconButtonType.transparent,
          onTap: () {},
          icon: Icons.save_outlined,
        ),
      ],
      body: MDSList(
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
