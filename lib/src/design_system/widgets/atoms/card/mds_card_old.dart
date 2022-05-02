import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

enum CardShadowType {
  none,
  light,
  medium,
  dark,
}

class MDSCardOld extends StatelessWidget with ColorMixin, SpacingMixin {
  final CardShadowType? shadowType;
  final Widget child;

  MDSCardOld({
    required this.child,
    this.shadowType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(spacing1),
        child: child,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing1),
        border: shadowType == CardShadowType.none
            ? Border.all(
                width: spacing0_5,
                style: BorderStyle.solid,
                color: secondaryLight,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: _getBlurRadius(),
            offset: _getOffset(),
          ),
        ],
      ),
    );
  }

  Offset _getOffset() {
    switch (shadowType) {
      case CardShadowType.none:
        return Offset(noSpacing, noSpacing);
      case CardShadowType.light:
        return Offset(noSpacing, spacing0_5);
      case CardShadowType.medium:
        return Offset(noSpacing, spacing0_5);
      case CardShadowType.dark:
        return Offset(noSpacing, spacing1);
      default:
        return Offset(noSpacing, spacing0_5);
    }
  }

  double _getBlurRadius() {
    switch (shadowType) {
      case CardShadowType.none:
        return noSpacing;
      case CardShadowType.light:
        return spacing1;
      case CardShadowType.medium:
        return spacing2;
      case CardShadowType.dark:
        return spacing2;
      default:
        return spacing2;
    }
  }
}
