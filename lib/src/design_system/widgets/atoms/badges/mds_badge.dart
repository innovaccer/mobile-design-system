import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

enum BadgeType {
  solid,
  subtle,
}

enum BadgeAppearance {
  jal,
  stone,
  neem,
  haldi,
  mirch,
  tawak,
  nimbu,
  neel,
  jamun,
}

class MDSBadge extends StatelessWidget with ColorMixin, SpacingMixin, FontMixin {
  /// [badgeText] is text displayed on the Badge
  final String badgeText;

  /// type of the badge
  final BadgeType badgeType;

  /// badge appearance
  final BadgeAppearance badgeAppearance;

  MDSBadge({required this.badgeText, required this.badgeType, required this.badgeAppearance});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: py0_5 + px1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing1),
        color: _getBadgeBackgroundColor(),
      ),
      child: _badgeWidget(),
    );
  }

  Widget _badgeWidget() {
    return Wrap(
      children: [
        Text(
          badgeText,
          style: TextStyle(
            color: _getBadgeTextColor(),
            fontSize: fontSize12,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Color _getBadgeBackgroundColor() {
    switch (badgeAppearance) {
      case BadgeAppearance.jal:
        return isSolid ? primary : primaryLightest;
      case BadgeAppearance.stone:
        return isSolid ? secondaryLight : secondaryLight;
      case BadgeAppearance.neem:
        return isSolid ? success : successLightest;
      case BadgeAppearance.haldi:
        return isSolid ? warning : warningLightest;
      case BadgeAppearance.mirch:
        return isSolid ? alert : alertLightest;
      case BadgeAppearance.tawak:
        return isSolid ? accent1 : accent1Lightest;
      case BadgeAppearance.nimbu:
        return isSolid ? accent4 : accent4Lightest;
      case BadgeAppearance.neel:
        return isSolid ? accent3 : accent3Lightest;
      case BadgeAppearance.jamun:
        return isSolid ? accent2 : accent2Lightest;
      default:
        return primary;
    }
  }

  Color _getBadgeTextColor() {
    switch (badgeAppearance) {
      case BadgeAppearance.jal:
        return isSolid ? ColorToken.white : primaryDark;
      case BadgeAppearance.stone:
        return isSolid ? inverse : inverse;
      case BadgeAppearance.neem:
        return isSolid ? ColorToken.white : successDark;
      case BadgeAppearance.haldi:
        return isSolid ? warningDarker : warningDarker;
      case BadgeAppearance.mirch:
        return isSolid ? ColorToken.white : alertDark;
      case BadgeAppearance.tawak:
        return isSolid ? ColorToken.white : accent1Darker;
      case BadgeAppearance.nimbu:
        return isSolid ? accent4Darker : accent4Darker;
      case BadgeAppearance.neel:
        return isSolid ? ColorToken.white : accent3Dark;
      case BadgeAppearance.jamun:
        return isSolid ? ColorToken.white : accent2Dark;
      default:
        return ColorToken.white;
    }
  }

  bool get isSolid => badgeType == BadgeType.solid;
}
