import 'package:example/widget/example_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSTitleScreen extends StatefulWidget {
  static const String routeName = '/mds_title_screen';

  @override
  _MDSTitleScreenState createState() => _MDSTitleScreenState();
}

class _MDSTitleScreenState extends State<MDSTitleScreen> with SpacingMixin {
  late TitleType _type;
  late TitleAppearance _appearance;

  @override
  void initState() {
    super.initState();
    _type = TitleType.title1;
    _appearance = TitleAppearance.defaultType;
  }

  @override
  Widget build(BuildContext context) {
    final String sampleText = 'This is sample Title';
    return Scaffold(
      appBar: ExampleAppBar(
        title: 'MDSTitle',
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
                  child: MDSTitle(
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
                                displayText: 'largeTitle',
                                groupValue: _type,
                                value: TitleType.largeTitle,
                              ),
                              _typeOptionWidget(
                                displayText: 'title1',
                                groupValue: _type,
                                value: TitleType.title1,
                              ),
                              _typeOptionWidget(
                                displayText: 'title2',
                                groupValue: _type,
                                value: TitleType.title2,
                              ),
                              _typeOptionWidget(
                                displayText: 'title3',
                                groupValue: _type,
                                value: TitleType.title3,
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
                                value: TitleAppearance.defaultType,
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

  void _updateSize(TitleType? value) {
    setState(() {
      _type = value!;
    });
  }

  void _updateAppearance(TitleAppearance? value) {
    setState(() {
      _appearance = value!;
    });
  }

  Widget _typeOptionWidget({
    required TitleType value,
    required TitleType groupValue,
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
    required TitleAppearance value,
    required TitleAppearance groupValue,
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
