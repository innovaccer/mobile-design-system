import 'package:flutter/material.dart';

import '../../../../../innovaccer_design_system.dart';

enum IconButtonType {
  basic,
  transparent,
}

enum IconButtonState {
  active,
  defaultType,
  disabled,
  loading,
  selected,
}

class MDSIconButton extends StatelessWidget with ColorMixin, SpacingMixin, FontMixin {
  /// [onTap] is sent as callback when the button is tapped
  final Function? onTap;

  /// [icon] is text displayed on the Button
  final IconData icon;

  /// appearance of the button
  final IconButtonType type;

  /// current state of the button
  final IconButtonState state;

  MDSIconButton({
    required this.icon,
    this.onTap,
    this.type = IconButtonType.basic,
    this.state = IconButtonState.defaultType,
  });

  @override
  Widget build(BuildContext context) {
    Widget widget = _isInLoadingState ? _loadingWidget() : _iconButtonWidget();

    return IgnorePointer(
      ignoring: (state != IconButtonState.defaultType),
      child: widget,
    );
  }

  Widget _iconButtonWidget() {
    Color? contentColor = _contentColorMapping[type]?[state];
    Color? buttonColor = _buttonColorMapping[type]?[state];
    Color? buttonActiveColor = _buttonColorMapping[type]?[IconButtonState.active];

    return Ink(
      height: spacing4 - spacingM,
      width: spacing4 - spacingM,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(spacing3),
      ),
      child: Material(
        color: ColorToken.transparent,
        child: InkWell(
          onTap: ()=>onTap,
          borderRadius: BorderRadius.circular(spacing3),
          hoverColor: buttonActiveColor,
          splashColor: buttonActiveColor,
          overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> materialStates) {
            return ColorToken.transparent;
          }),
          highlightColor: buttonActiveColor,
          child: Icon(
            icon,
            color: contentColor,
            size: spacingXL,
          ),
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    Color? contentColor = _contentColorMapping[type]?[state];
    Color? buttonColor = _buttonColorMapping[type]?[state];

    return Ink(
      height: spacing4 - spacingM,
      width: spacing4 - spacingM,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(spacing3),
      ),
      child: Center(
        child: SizedBox(
          height: spacingXL - spacingM,
          width: spacingXL - spacingM,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color?>(contentColor),
            strokeWidth: spacingS + spacingXS,
          ),
        ),
      ),
    );
  }

  Map<IconButtonType, Map<IconButtonState, Color>> get _buttonColorMapping => {
    IconButtonType.basic: {
      IconButtonState.active: secondaryDark,
      IconButtonState.defaultType: secondaryLight,
      IconButtonState.disabled: secondaryLight,
      IconButtonState.loading: secondaryLight,
      IconButtonState.selected: primaryLightest,
    },
    IconButtonType.transparent: {
      IconButtonState.active: secondaryDark,
      IconButtonState.defaultType: ColorToken.transparent,
      IconButtonState.disabled: ColorToken.transparent,
      IconButtonState.loading: ColorToken.transparent,
      IconButtonState.selected: primaryLightest,
    },
  };

  Map<IconButtonType, Map<IconButtonState, Color>> get _contentColorMapping => {
    IconButtonType.basic: {
      IconButtonState.active: inverse,
      IconButtonState.defaultType: inverse,
      IconButtonState.disabled: inverseLightest,
      IconButtonState.loading: inverseLightest,
      IconButtonState.selected: primary,
    },
    IconButtonType.transparent: {
      IconButtonState.active: inverse,
      IconButtonState.defaultType: inverse,
      IconButtonState.disabled: inverseLightest,
      IconButtonState.loading: inverseLightest,
      IconButtonState.selected: primary,
    },
  };

  bool get _isInLoadingState => state == IconButtonState.loading;
}
