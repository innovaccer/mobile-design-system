import 'package:example/widget/example_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSHeadlineScreen extends StatefulWidget {
  static const String routeName = '/mds_headline_screen';

  @override
  _MDSHeadlineScreenState createState() => _MDSHeadlineScreenState();
}

class _MDSHeadlineScreenState extends State<MDSHeadlineScreen> with SpacingMixin {
  late HeadlineAppearance _appearance;

  @override
  void initState() {
    super.initState();
    _appearance = HeadlineAppearance.defaultType;
  }

  @override
  Widget build(BuildContext context) {
    final String sampleText = 'This is sample Headline';
    return Scaffold(
      appBar: ExampleAppBar(
        title: 'MDSHeadline',
        buildContext: context,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: p4,
                child: Center(
                  child: MDSHeadline(
                    sampleText,
                    appearance: _appearance,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(
              flex: 7,
              child: Container(
                padding: px8,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: pt2,
                            child: MDSSubhead(
                              'appearance:',
                              appearance: SubheadAppearance.medium,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              _appearanceOptionWidget(
                                displayText: 'defaultType',
                                groupValue: _appearance,
                                value: HeadlineAppearance.defaultType,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _updateAppearance(HeadlineAppearance? value) {
    setState(() {
      _appearance = value!;
    });
  }

  Widget _appearanceOptionWidget({
    required HeadlineAppearance value,
    required HeadlineAppearance groupValue,
    required String displayText,
  }) {
    return GestureDetector(
      onTap: () => _updateAppearance(value),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: value,
            groupValue: groupValue,
            onChanged: _updateAppearance,
          ),
          MDSBody(
            displayText,
          ),
        ],
      ),
    );
  }
}
