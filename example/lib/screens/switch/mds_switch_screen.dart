import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSSwitchScreen extends StatefulWidget {
  static const String routeName = '/mds_switch_screen';

  @override
  State<MDSSwitchScreen> createState() => _MDSSwitchScreenState();
}

class _MDSSwitchScreenState extends State<MDSSwitchScreen> with SpacingMixin {
  SwitchType _switchType = SwitchType.defaultType;
  SwitchState _switchState = SwitchState.off;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSHeadline(
          'Switch',
        ),
      ),
      body: Padding(
        padding: px4 + pt2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: spacing5,
            ),
            MDSSwitch(
              switchState: _switchState,
              switchType: _switchType,
              onChange: (bool value) {
                setState(() {
                  value ? _switchState = SwitchState.on : _switchState = SwitchState.off;
                });
              },
            ),
            SizedBox(
              height: spacing5,
            ),
            Divider(),
            Expanded(
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
                              value: SwitchType.defaultType,
                              groupValue: _switchType,
                              displayText: 'default',
                            ),
                            _typeOptionWidget(
                              value: SwitchType.activeType,
                              groupValue: _switchType,
                              displayText: 'active',
                            ),
                            _typeOptionWidget(
                              value: SwitchType.disabledType,
                              groupValue: _switchType,
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
                        child: MDSSubhead('State'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Wrap(
                          children: [
                            _stateOptionWidget(
                              value: SwitchState.on,
                              groupValue: _switchState,
                              displayText: 'on',
                            ),
                            _stateOptionWidget(
                              value: SwitchState.off,
                              groupValue: _switchState,
                              displayText: 'off',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _typeOptionWidget({
    required SwitchType value,
    required SwitchType groupValue,
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

  void _updateType(SwitchType? value) {
    setState(() {
      _switchType = value!;
    });
  }

  Widget _stateOptionWidget({
    required SwitchState value,
    required SwitchState groupValue,
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

  void _updateState(SwitchState? value) {
    setState(() {
      _switchState = value!;
    });
  }
}
