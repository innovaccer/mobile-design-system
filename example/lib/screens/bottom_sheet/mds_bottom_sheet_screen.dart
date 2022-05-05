import 'package:example/utils/locator/locator.dart';
import 'package:example/widget/check_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSBottomSheetScreen extends StatefulWidget {
  static const String routeName = '/mds_bottom_sheet_screen';

  @override
  _MDSBottomSheetScreenState createState() => _MDSBottomSheetScreenState();
}

class _MDSBottomSheetScreenState extends State<MDSBottomSheetScreen> with SpacingMixin, ColorMixin {
  late String heading;
  late String subHeading;
  late Widget child;

  // late Color barrierColor;
  late bool dragHandle, isDismissible, headingChecked, subHeadingChecked, smallContentChecked, fieldChecked, largeContentChecked;

  @override
  void initState() {
    super.initState();
    heading = 'Heading';
    subHeading = 'This is sub heading of bottom sheet';
    headingChecked = true;
    subHeadingChecked = true;
    smallContentChecked = true;
    fieldChecked = false;
    largeContentChecked = false;
    dragHandle = true;
    isDismissible = true;
    child = _smallContent(appNavigator.getContext());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSHeadline(
          'Bottom Sheet',
        ),
      ),
      body: Padding(
        padding: p4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MDSBody(
              'Properties',
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                CheckBoxWidget(
                  'Heading',
                  (checked) {
                    if (checked) {
                      heading = 'Heading';
                    } else {
                      heading = '';
                    }
                    setState(() {
                      headingChecked = checked;
                    });
                  },
                  headingChecked,
                ),
                CheckBoxWidget(
                  'SubHeading',
                  (checked) {
                    if (checked) {
                      subHeading = 'This is sub heading of bottom sheet';
                    } else {
                      subHeading = '';
                    }

                    setState(() {
                      subHeadingChecked = checked;
                    });
                  },
                  subHeadingChecked,
                ),
                CheckBoxWidget(
                  'DragHandle',
                  (checked) {
                    if (checked) {
                      dragHandle = true;
                    } else {
                      dragHandle = false;
                    }
                    setState(() {
                      dragHandle = checked;
                    });
                  },
                  dragHandle,
                ),
                // Check(
                //   'Dismissible',
                //   (checked) {
                //     if (checked) {
                //       isDismissible = true;
                //       barrierColor = Colors.transparent;
                //     } else {
                //       isDismissible = false;
                //     }
                //     setState(() {
                //       isDismissible = checked;
                //     });
                //   },
                //   isDismissible,
                // ),
              ],
            ),
            SizedBox(
              height: spacing2,
            ),
            Divider(),
            SizedBox(
              height: spacing2,
            ),
            MDSBody(
              'Content Type',
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                CheckBoxWidget(
                  'Small',
                  (checked) {
                    if (checked) {
                      setState(() {
                        child = _smallContent(context);
                        smallContentChecked = true;
                        largeContentChecked = false;
                        fieldChecked = false;
                      });
                    } else {
                      child = Container();
                    }
                  },
                  smallContentChecked,
                ),
                CheckBoxWidget(
                  'Large',
                  (checked) {
                    if (checked) {
                      setState(() {
                        child = _largeContent(context);
                        largeContentChecked = true;
                        smallContentChecked = false;
                        fieldChecked = false;
                      });
                    } else {
                      child = Container();
                    }
                  },
                  largeContentChecked,
                ),

                /// todo
                // Check(
                //   'TextFieldContent',
                //   (checked) {
                //     if (checked) {
                //       setState(() {
                //         child = _fieldContent(context);
                //         fieldChecked = true;
                //         largeContentChecked = false;
                //         smallContentChecked = false;
                //       });
                //     } else {
                //       child = Container();
                //     }
                //   },
                //   fieldChecked,
                // ),
              ],
            ),
            SizedBox(
              height: spacing2,
            ),
            Divider(),
            SizedBox(
              height: spacing2,
            ),
            Center(
              child: MDSButton(
                type: ButtonType.primary,
                title: 'Open BottomSheet',
                onTap: openBottomSheet,
                isFullWidth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openBottomSheet() async {
    await MDSBottomSheet().open(
      context: context,
      heading: heading,
      child: child,
      subHeading: subHeading,
      dragHandle: dragHandle,
      // barrierColor: barrierColor,
      isDismissible: isDismissible,
    );
  }

  Widget _smallContent(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          height: 100,
          width: width,
          color: warning,
        ),
        Container(
          height: 100,
          width: width,
          color: success,
        ),
        Container(
          height: 100,
          width: width,
          color: alert,
        ),
      ],
    );
  }

  Widget _largeContent(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          height: 100,
          width: width,
          color: warning,
        ),
        Container(
          height: 100,
          width: width,
          color: success,
        ),
        Container(
          height: 100,
          width: width,
          color: alert,
        ),
        Container(
          height: 100,
          width: width,
          color: accent2,
        ),
        Container(
          height: 100,
          width: width,
          color: accent3,
        ),
        Container(
          height: 100,
          width: width,
          color: accent4,
        ),
        Container(
          height: 100,
          width: width,
          color: warning,
        ),
        Container(
          height: 100,
          width: width,
          color: success,
        ),
        Container(
          height: 100,
          width: width,
          color: alert,
        ),
      ],
    );
  }

  /// todo
//
// Widget _fieldContent(BuildContext context) {
//   var width = MediaQuery.of(context).size.width;
//   return ListView(
//     shrinkWrap: true,
//     children: [
//       MDSInput(
//         textInputType: TextInputType.text,
//         parentContext: context,
//         textEditingController: TextEditingController(),
//         prefixIcon: Icons.person_outline,
//         textFormFieldKey: GlobalKey<FormFieldState>(),
//       ),
//       Container(
//         height: 100,
//         width: width,
//         color: warning,
//       ),
//       Container(
//         height: 100,
//         width: width,
//         color: success,
//       ),
//       Container(
//         height: 100,
//         width: width,
//         color: alert,
//       ),
//       Container(
//         height: 100,
//         width: width,
//         color: warning,
//       ),
//       MDSInput(
//         textInputType: TextInputType.text,
//         parentContext: context,
//         textEditingController: TextEditingController(),
//         prefixIcon: Icons.person_outline,
//         textFormFieldKey: GlobalKey<FormFieldState>(),
//       ),
//       Container(
//         height: 100,
//         width: width,
//         color: warning,
//       ),
//       Container(
//         height: 100,
//         width: width,
//         color: success,
//       ),
//       Container(
//         height: 100,
//         width: width,
//         color: alert,
//       ),
//       Container(
//         height: 100,
//         width: width,
//         color: warning,
//       ),
//       MDSInput(
//         textInputType: TextInputType.text,
//         parentContext: context,
//         textEditingController: TextEditingController(),
//         prefixIcon: Icons.person_outline,
//         textFormFieldKey: GlobalKey<FormFieldState>(),
//       ),
//     ],
//   );
// }
}
