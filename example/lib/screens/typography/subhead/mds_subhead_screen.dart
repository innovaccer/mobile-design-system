import 'package:example/widget/example_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSSubheadScreen extends StatefulWidget {
  static const String routeName = '/mds_subhead_screen';

  @override
  _MDSSubheadScreenState createState() => _MDSSubheadScreenState();
}

class _MDSSubheadScreenState extends State<MDSSubheadScreen> with SpacingMixin {
  late SubheadAppearance _appearance;

  @override
  void initState() {
    super.initState();
    _appearance = SubheadAppearance.defaultType;
  }

  @override
  Widget build(BuildContext context) {
    final String sampleText = 'This is sample Subhead';
    return Scaffold(
      appBar: ExampleAppBar(
        title: 'MDSSubhead',
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
                  child: MDSSubhead(
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
                                value: SubheadAppearance.defaultType,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'disabled',
                                groupValue: _appearance,
                                value: SubheadAppearance.disabled,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'error',
                                groupValue: _appearance,
                                value: SubheadAppearance.error,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'medium',
                                groupValue: _appearance,
                                value: SubheadAppearance.medium,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'strong',
                                groupValue: _appearance,
                                value: SubheadAppearance.strong,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'subtle',
                                groupValue: _appearance,
                                value: SubheadAppearance.subtle,
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


  void _updateAppearance(SubheadAppearance? value) {
    setState(() {
      _appearance = value!;
    });
  }

  Widget _appearanceOptionWidget({
    required SubheadAppearance value,
    required SubheadAppearance groupValue,
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
