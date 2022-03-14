import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

enum CardShadowType {
  none,
  light,
  medium,
  dark,
}

class MDSCard extends StatelessWidget with ColorMixin, SpacingMixin {
  final CardShadowType? shadowType;
  final Widget child;

  MDSCard({
    required this.child,
    this.shadowType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(spacingM),
        child: child,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacingM),
        border: shadowType == CardShadowType.none
            ? Border.all(
                width: spacingXS,
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
        return Offset(noSpacing, spacingXS);
      case CardShadowType.medium:
        return Offset(noSpacing, spacingS);
      case CardShadowType.dark:
        return Offset(noSpacing, spacingM);
      default:
        return Offset(noSpacing, spacingS);
    }
  }

  double _getBlurRadius() {
    switch (shadowType) {
      case CardShadowType.none:
        return noSpacing;
      case CardShadowType.light:
        return spacingM;
      case CardShadowType.medium:
        return spacing;
      case CardShadowType.dark:
        return spacing2;
      default:
        return spacing;
    }
  }
}
