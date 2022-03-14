import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSButtonScreen extends StatefulWidget {
  static const String routeName = '/mds_button_new_screen';

  @override
  _MDSButtonScreenState createState() => _MDSButtonScreenState();
}

class _MDSButtonScreenState extends State<MDSButtonScreen>
    with SpacingMixin, ColorMixin {
  late ButtonType _type;
  late ButtonState _state;
  late bool _isFullWidth;
  IconData? _prefixIcon;
  IconData? _suffixIcon;

  @override
  void initState() {
    super.initState();
    _type = ButtonType.basic;
    _state = ButtonState.defaultType;
    _isFullWidth = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSTitle(
          'MDSButton',
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
                    child: MDSButton(
                      title: 'Tap me',
                      onTap: () {
                        print('tapped!!');
                      },
                      isFullWidth: _isFullWidth,
                      state: _state,
                      type: _type,
                      prefixIcon: _prefixIcon,
                      suffixIcon: _suffixIcon,
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
                        child: MDSSubhead('Type'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Wrap(
                          children: [
                            _typeOptionWidget(
                              value: ButtonType.basic,
                              groupValue: _type,
                              displayText: 'basic',
                            ),
                            _typeOptionWidget(
                              value: ButtonType.primary,
                              groupValue: _type,
                              displayText: 'primary',
                            ),
                            _typeOptionWidget(
                              value: ButtonType.alert,
                              groupValue: _type,
                              displayText: 'alert',
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
                        child: MDSSubhead('State'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Wrap(
                          children: [
                            _stateOptionWidget(
                              value: ButtonState.active,
                              groupValue: _state,
                              displayText: 'active',
                            ),
                            _stateOptionWidget(
                              value: ButtonState.defaultType,
                              groupValue: _state,
                              displayText: 'default',
                            ),
                            _stateOptionWidget(
                              value: ButtonState.disabled,
                              groupValue: _state,
                              displayText: 'disabled',
                            ),
                            _stateOptionWidget(
                              value: ButtonState.loading,
                              groupValue: _state,
                              displayText: 'loading',
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
                        child: MDSSubhead('isFullWidth'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: MDSCommon.isAndroid()
                                  ? Switch(
                                      value: _isFullWidth,
                                      onChanged: _updateFullWidthValue,
                                    )
                                  : CupertinoSwitch(
                                      value: _isFullWidth,
                                      onChanged: _updateFullWidthValue,
                                    ),
                              padding: pl4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  MDSFootnote(
                    'Button will take all available space',
                    appearance: FootnoteAppearance.subtle,
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: MDSSubhead('Prefix Icon'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: MDSCommon.isAndroid()
                                  ? Switch(
                                      value: _prefixIcon != null,
                                      onChanged: _updatePrefixIconValue,
                                    )
                                  : CupertinoSwitch(
                                      value: _prefixIcon != null,
                                      onChanged: _updatePrefixIconValue,
                                    ),
                              padding: pl4,
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
                        child: MDSSubhead('Suffix Icon'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: MDSCommon.isAndroid()
                                  ? Switch(
                                      value: _suffixIcon != null,
                                      onChanged: _updateSuffixIconValue,
                                    )
                                  : CupertinoSwitch(
                                      value: _suffixIcon != null,
                                      onChanged: _updateSuffixIconValue,
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

  Widget _typeOptionWidget({
    required ButtonType value,
    required ButtonType groupValue,
    required String displayText,
  }) {
    return GestureDetector(
      onTap: () => _updateType(value),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: value,
            groupValue: groupValue,
            onChanged: _updateType,
          ),
          MDSBody(
            displayText,
          ),
        ],
      ),
    );
  }

  void _updateType(ButtonType? value) {
    setState(() {
      _type = value!;
    });
  }

  Widget _stateOptionWidget({
    required ButtonState value,
    required ButtonState groupValue,
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

  void _updateState(ButtonState? value) {
    setState(() {
      _state = value!;
    });
  }

  void _updateFullWidthValue(bool value) {
    setState(() {
      _isFullWidth = value;
    });
  }

  void _updatePrefixIconValue(bool value) {
    if (value) {
      if (_suffixIcon != null) {
        displayToast(
          message: 'Prefix and suffix icons can\'t be used together!',
          appearanceType: ToastAppearanceType.alert,
        );
      } else {
        setState(() {
          _prefixIcon = Icons.fingerprint;
        });
      }
    } else {
      setState(() {
        _prefixIcon = null;
      });
    }
  }

  void _updateSuffixIconValue(bool value) {
    if (value) {
      if (_prefixIcon != null) {
        displayToast(
          message: 'Prefix and suffix icons can\'t be used together!',
          appearanceType: ToastAppearanceType.alert,
        );
      } else {
        setState(() {
          _suffixIcon = Icons.fingerprint;
        });
      }
    } else {
      setState(() {
        _suffixIcon = null;
      });
    }
  }
}
