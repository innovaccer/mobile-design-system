import 'package:example/widget/example_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSCaptionScreen extends StatefulWidget {
  static const String routeName = '/mds_caption_screen';

  @override
  _MDSCaptionScreenState createState() => _MDSCaptionScreenState();
}

class _MDSCaptionScreenState extends State<MDSCaptionScreen> with SpacingMixin {
  late CaptionType _type;
  late CaptionAppearance _appearance;

  @override
  void initState() {
    super.initState();
    _type = CaptionType.caption1;
    _appearance = CaptionAppearance.defaultType;
  }

  @override
  Widget build(BuildContext context) {
    final String sampleText = 'This is sample Caption';
    return Scaffold(
      appBar: ExampleAppBar(
        title: 'MDSCaption',
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
                  child: MDSCaption(
                    sampleText,
                    type: _type,
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
                              'type:',
                              appearance: SubheadAppearance.medium,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              _typeOptionWidget(
                                displayText: 'caption1',
                                groupValue: _type,
                                value: CaptionType.caption1,
                              ),
                              _typeOptionWidget(
                                displayText: 'caption2',
                                groupValue: _type,
                                value: CaptionType.caption2,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1),
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
                                value: CaptionAppearance.defaultType,
                              ),
                              _appearanceOptionWidget(
                                displayText: 'subtle',
                                groupValue: _appearance,
                                value: CaptionAppearance.subtle,
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

  void _updateSize(CaptionType? value) {
    setState(() {
      _type = value!;
    });
  }

  void _updateAppearance(CaptionAppearance? value) {
    setState(() {
      _appearance = value!;
    });
  }

  Widget _typeOptionWidget({
    required CaptionType value,
    required CaptionType groupValue,
    required String displayText,
  }) {
    return GestureDetector(
      onTap: () => _updateSize(value),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: value,
            groupValue: groupValue,
            onChanged: _updateSize,
          ),
          MDSBody(
            displayText,
          ),
        ],
      ),
    );
  }

  Widget _appearanceOptionWidget({
    required CaptionAppearance value,
    required CaptionAppearance groupValue,
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
