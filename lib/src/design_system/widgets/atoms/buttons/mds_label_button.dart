import 'package:flutter/material.dart';

import '../../../../../innovaccer_design_system.dart';
enum LabelButtonState {
  active,
  defaultType,
  disabled,
}

class MDSLabelButton extends StatelessWidget with ColorMixin, SpacingMixin, FontMixin {
  /// [onTap] is sent as callback when the button is tapped
  final Function? onTap;

  /// [title] is text displayed on the Button
  final String? title;

  /// to give an icon on the left side of [title]
  /// [prefixIcon] can be a Material icon or Cupertino icon
  final IconData? prefixIcon;

  /// current state of the button
  final LabelButtonState? state;

  MDSLabelButton({
    required this.title,
    required this.onTap,
    this.state = LabelButtonState.defaultType,
    this.prefixIcon,
  })  : assert(onTap != null),
        assert(title != null),
        assert(title!.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    Widget widget = TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith<EdgeInsets>((Set<MaterialState> materialStates) {
          return px4 + py5;
        }),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((Set<MaterialState> materialStates) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacingM + spacingS),
          );
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> materialStates) {
          return Colors.transparent;
        }),
        foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> materialStates) {
          if (state == LabelButtonState.disabled) {
            return inverseLightest;
          }
          if (state == LabelButtonState.active ||
              materialStates.contains(MaterialState.hovered) ||
              materialStates.contains(MaterialState.focused) ||
              materialStates.contains(MaterialState.pressed)) {
            return primaryDark;
          }
          return primary;
        }),
      ),
      onPressed: ()=>onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// aligning icon to left of [title]
          if (prefixIcon != null) ...[
            Padding(
              padding: pr3 + pr2,
              child: Icon(
                prefixIcon,
                size: spacing2 + spacingM,
              ),
            ),
          ],
          Flexible(
            child: MDSLink(
              title,
              textAlign: TextAlign.center,
              textOverflow: TextOverflow.ellipsis,
              maxLines: 2,
              useDefaultTextColor: true,
            ),
          ),
        ],
      ),
    );

    return IgnorePointer(
      ignoring: (state != LabelButtonState.defaultType),
      child: widget,
    );
  }
}
