import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

enum ButtonType {
  basic,
  primary,
  alert,
}

enum ButtonState {
  active,
  defaultType,
  disabled,
  loading,
}

class MDSButton extends StatelessWidget
    with ColorMixin, SpacingMixin, FontMixin {
  /// [onTap] is sent as callback when the button is tapped
  final Function()? onTap;

  /// [title] is text displayed on the Button
  final String title;

  /// [isFullWidth] indicates if the button needs to take full available width
  final bool isFullWidth;

  /// to give an icon on the left side of [title]
  /// [prefixIcon] can be a Material icon or Cupertino icon
  final IconData? prefixIcon;

  /// to give an icon on the right side of [title]
  /// [suffixIcon] can be a Material icon or Cupertino icon
  final IconData? suffixIcon;

  /// appearance of the button
  final ButtonType type;

  /// current state of the button
  final ButtonState state;

  MDSButton({
    required this.title,
    required this.onTap,
    this.type = ButtonType.basic,
    this.state = ButtonState.defaultType,
    this.isFullWidth = false,
    this.prefixIcon,
    this.suffixIcon,
  })  : assert((prefixIcon == null && suffixIcon == null) ||
            (prefixIcon == null && suffixIcon != null) ||
            (prefixIcon != null && suffixIcon == null));

  @override
  Widget build(BuildContext context) {
    Widget widget = _regularButton();

    return IgnorePointer(
      ignoring: (state != ButtonState.defaultType),
      child: widget,
    );
  }

  Widget _regularButton() {
    Color? contentColor = _contentColorMapping[type]?[state];
    Color? buttonColor = _buttonColorMapping[type]?[state];
    Color? buttonActiveColor = _buttonColorMapping[type]?[ButtonState.active];

    Widget button = ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> materialStates) {
          return noSpacing;
        }),
        shadowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> materialStates) {
          return ColorToken.transparent;
        }),
        padding: MaterialStateProperty.resolveWith<EdgeInsets>(
            (Set<MaterialState> materialStates) {
          return (prefixIcon == null && suffixIcon == null)
              ? py5 - py2 + px6
              : py5 - py2 + px5;
        }),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> materialStates) {
          return Size(56, 44);
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
            (Set<MaterialState> materialStates) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacing),
          );
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> materialStates) {
          return ColorToken.transparent;
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> materialStates) {
          if (materialStates.contains(MaterialState.hovered) ||
              materialStates.contains(MaterialState.focused) ||
              materialStates.contains(MaterialState.pressed)) {
            return buttonActiveColor;
          }
          return buttonColor;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> materialStates) {
          if (materialStates.contains(MaterialState.hovered) ||
              materialStates.contains(MaterialState.focused) ||
              materialStates.contains(MaterialState.pressed)) {
            return buttonActiveColor;
          }
          return buttonColor;
        }),
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Visibility(
            visible: !_isInLoadingState,
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// aligning icon to left of [title]
                if (prefixIcon != null) ...[
                  Padding(
                    padding: pr3 + pr2 + pt2,
                    child: Icon(
                      prefixIcon,
                      color: contentColor,
                      size: spacing2 + spacingM,
                    ),
                  ),
                ],

                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MDSBody(
                        title,
                        textAlign: TextAlign.center,
                        appearance: BodyAppearance.medium,
                        color: contentColor,
                      ),
                    ],
                  ),
                ),

                /// aligning icon to right of [title]
                if (suffixIcon != null) ...[
                  Padding(
                    padding: pl3 + pl2 + pt2,
                    child: Icon(
                      suffixIcon,
                      color: contentColor,
                      size: spacing2 + spacingM,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Visibility(
              visible: _isInLoadingState,
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
            ),
          ),
        ],
      ),

      /// sending callback on button click
      onPressed: onTap,
    );

    if (isFullWidth) {
      return Container(
        width: double.infinity,
        child: button,
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: button),
        ],
      );
    }
  }

  Map<ButtonType, Map<ButtonState, Color>> get _buttonColorMapping => {
        ButtonType.primary: {
          ButtonState.defaultType: primary,
          ButtonState.active: primaryDark,
          ButtonState.disabled: primaryLighter,
          ButtonState.loading: primaryLighter,
        },
        ButtonType.alert: {
          ButtonState.defaultType: alert,
          ButtonState.active: alertDarker,
          ButtonState.disabled: alertLighter,
          ButtonState.loading: alertLighter,
        },
        ButtonType.basic: {
          ButtonState.defaultType: secondaryLight,
          ButtonState.active: secondaryDark,
          ButtonState.disabled: secondaryLight,
          ButtonState.loading: secondaryLight,
        },
      };

  Map<ButtonType, Map<ButtonState, Color>> get _contentColorMapping => {
        ButtonType.primary: {
          ButtonState.defaultType: ColorToken.white,
          ButtonState.active: ColorToken.white,
          ButtonState.disabled: ColorToken.white,
          ButtonState.loading: ColorToken.white,
        },
        ButtonType.alert: {
          ButtonState.defaultType: ColorToken.white,
          ButtonState.active: ColorToken.white,
          ButtonState.disabled: ColorToken.white,
          ButtonState.loading: ColorToken.white,
        },
        ButtonType.basic: {
          ButtonState.defaultType: inverse,
          ButtonState.active: inverse,
          ButtonState.disabled: inverseLightest,
          ButtonState.loading: inverseLightest,
        },
      };

  bool get _isInLoadingState => state == ButtonState.loading;
}
