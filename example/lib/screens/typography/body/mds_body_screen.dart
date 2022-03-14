import 'package:example/widget/example_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSBodyScreen extends StatefulWidget {
  static const String routeName = '/mds_body_screen';

  @override
  _MDSBodyScreenState createState() => _MDSBodyScreenState();
}

class _MDSBodyScreenState extends State<MDSBodyScreen> with SpacingMixin {
  late BodyAppearance _appearance;

  @override
  void initState() {
    super.initState();
    _appearance = BodyAppearance.defaultType;
  }

  @override
  Widget build(BuildContext context) {
    final String sampleText = 'This is sample Body';
    return Scaffold(
      appBar: ExampleAppBar(
        title: 'MDSBody',
        buildContext: context,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: p6,
                child: Center(
                  child: MDSBody(
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
                            padding: pt4,
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
                                value: BodyAppearance.defaultType,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'disabled',
                                groupValue: _appearance,
                                value: BodyAppearance.disabled,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'error',
                                groupValue: _appearance,
                                value: BodyAppearance.error,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'medium',
                                groupValue: _appearance,
                                value: BodyAppearance.medium,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'strong',
                                groupValue: _appearance,
                                value: BodyAppearance.strong,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'subtle',
                                groupValue: _appearance,
                                value: BodyAppearance.subtle,
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


  void _updateAppearance(BodyAppearance? value) {
    setState(() {
      _appearance = value!;
    });
  }

  Widget _appearanceOptionWidget({
    required BodyAppearance value,
    required BodyAppearance groupValue,
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
