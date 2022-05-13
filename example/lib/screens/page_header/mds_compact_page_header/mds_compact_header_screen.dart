import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSCompactPageHeaderScreen extends StatelessWidget {
  static const String routeName = '/compact_page_header_screen';

  const MDSCompactPageHeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MDSCompactPageHeader(
      heading: 'Heading',
      subHeading: 'Sub Heading',
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
