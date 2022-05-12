import 'package:example/widget/example_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSFootnoteScreen extends StatefulWidget {
  static const String routeName = '/mds_footnote_screen';

  @override
  _MDSFootnoteScreenState createState() => _MDSFootnoteScreenState();
}

class _MDSFootnoteScreenState extends State<MDSFootnoteScreen> with SpacingMixin {
  late FootnoteAppearance _appearance;

  @override
  void initState() {
    super.initState();
    _appearance = FootnoteAppearance.defaultType;
  }

  @override
  Widget build(BuildContext context) {
    final String sampleText = 'This is sample footnote';
    return Scaffold(
      appBar: ExampleAppBar(
        title: 'MDSFootnote',
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
                  child: MDSFootnote(
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
                                value: FootnoteAppearance.defaultType,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'disabled',
                                groupValue: _appearance,
                                value: FootnoteAppearance.disabled,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'error',
                                groupValue: _appearance,
                                value: FootnoteAppearance.error,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'medium',
                                groupValue: _appearance,
                                value: FootnoteAppearance.medium,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'strong',
                                groupValue: _appearance,
                                value: FootnoteAppearance.strong,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'subtle',
                                groupValue: _appearance,
                                value: FootnoteAppearance.subtle,
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


  void _updateAppearance(FootnoteAppearance? value) {
    setState(() {
      _appearance = value!;
    });
  }

  Widget _appearanceOptionWidget({
    required FootnoteAppearance value,
    required FootnoteAppearance groupValue,
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
