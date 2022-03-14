import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSLabelButtonScreen extends StatefulWidget {
  static const String routeName = '/mds_label_button_screen';

  @override
  _MDSLabelButtonScreenState createState() => _MDSLabelButtonScreenState();
}

class _MDSLabelButtonScreenState extends State<MDSLabelButtonScreen>
    with SpacingMixin, ColorMixin {
  late LabelButtonState _state;
  IconData? _iconData;

  @override
  void initState() {
    super.initState();
    _state = LabelButtonState.defaultType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSTitle(
          'MDSLabelButton',
          type: TitleType.title3,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: px6,
                    child: MDSLabelButton(
                      title: 'This is a label button. Tap here.',
                      onTap: () {
                        print('tapped!!');
                      },
                      state: _state,
                      prefixIcon: _iconData,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 8,
            child: Container(
              padding: px6 + pt4,
              child: ListView(
                padding: p0,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: MDSSubhead('State'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Wrap(
                          children: [
                            _stateOptionWidget(
                              value: LabelButtonState.active,
                              groupValue: _state,
                              displayText: 'active',
                            ),
                            _stateOptionWidget(
                              value: LabelButtonState.defaultType,
                              groupValue: _state,
                              displayText: 'default',
                            ),
                            _stateOptionWidget(
                              value: LabelButtonState.disabled,
                              groupValue: _state,
                              displayText: 'disabled',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: MDSSubhead('Icon'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: MDSCommon.isAndroid()
                                  ? Switch(
                                      value: _iconData != null,
                                      onChanged: _updateIconDataValue,
                                    )
                                  : CupertinoSwitch(
                                      value: _iconData != null,
                                      onChanged: _updateIconDataValue,
                                    ),
                              padding: pl4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: spacingXL,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stateOptionWidget({
    required LabelButtonState value,
    required LabelButtonState groupValue,
    required String displayText,
  }) {
    return GestureDetector(
      onTap: () => _updateState(value),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: value,
            groupValue: groupValue,
            onChanged: _updateState,
          ),
          MDSBody(
            displayText,
          ),
        ],
      ),
    );
  }

  void _updateState(LabelButtonState? value) {
    setState(() {
      _state = value!;
    });
  }

  void _updateIconDataValue(bool value) {
    if (value) {
      setState(() {
        _iconData = Icons.fingerprint;
      });
    } else {
      setState(() {
        _iconData = null;
      });
    }
  }
}
