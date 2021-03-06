import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/src/design_system/widgets/miscellaneous/custom_splash_factory.dart';

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
      height: spacing11,
      width: spacing11,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(spacing8),
      ),
      child: Material(
        color: ColorToken.transparent,
        shadowColor: ColorToken.transparent,
        animationDuration: Duration(seconds: 0),
        child: InkWell(
          onTap: () {
            onTap!();
          },
          borderRadius: BorderRadius.circular(spacing8),
          hoverColor: buttonActiveColor,
          splashColor: buttonActiveColor,
          overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> materialStates) {
            return buttonActiveColor!;
          }),
          highlightColor: buttonActiveColor,
          splashFactory: CustomSplash.splashFactory,
          child: Icon(
            icon,
            color: contentColor,
            size: spacing6,
          ),
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    Color? contentColor = _contentColorMapping[type]?[state];
    Color? buttonColor = _buttonColorMapping[type]?[state];

    return Ink(
      height: spacing11,
      width: spacing11,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(spacing5 + spacing0_5),
      ),
      child: Center(
        child: SizedBox(
          height: spacing5,
          width: spacing5,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color?>(contentColor),
            strokeWidth: spacing0_5,
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
