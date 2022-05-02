import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';
import 'package:innovaccer_design_system/src/design_system/utils/custom_switch.dart';

enum SwitchState {
  on,
  off,
}

enum SwitchType { defaultType, activeType, disabledType }

class MDSSwitch extends StatelessWidget with ColorMixin, SpacingMixin {
  /// state of the switch
  final SwitchState switchState;

  /// type of the switch
  final SwitchType switchType;

  /// function to track changes in switch state
  final Function(bool value) onChange;

  const MDSSwitch({required this.switchState, required this.switchType, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return _switchWidget();
  }

  Widget _switchWidget() {
    return CustomSwitch(
      height: spacing6,
      width: spacing12,
      activeColor: _getSwitchColor(),
      inactiveColor: _getSwitchColor(),
      padding: spacing0_5,
      toggleSize: spacing5,
      value: isOn,
      borderRadius: spacing5,
      showOnOff: false,
      onToggle: (bool value) => switchType != SwitchType.disabledType ? onChange(value) : null,
    );
  }

  Color _getSwitchColor() {
    switch (switchType) {
      case SwitchType.defaultType:
        return isOn ? primary : secondaryLight;
      case SwitchType.activeType:
        return isOn ? primaryDarker : secondaryDark;
      case SwitchType.disabledType:
        return isOn ? primaryLighter : secondaryLight;
      default:
        return primary;
    }
  }

  bool get isOn => switchState == SwitchState.on;
}
