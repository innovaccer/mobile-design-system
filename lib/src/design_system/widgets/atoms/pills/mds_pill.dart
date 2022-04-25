import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

enum PillType {
  solid,
  subtle,
}

enum PillAppearance {
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

class MDSPill extends StatelessWidget with ColorMixin, SpacingMixin, FontMixin {
  /// [pillCount] is text displayed on the Pill
  final String pillCount;

  /// type of the pill
  final PillType pillType;

  /// pill appearance
  final PillAppearance pillAppearance;

  MDSPill({required this.pillCount, required this.pillType, required this.pillAppearance});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: spacingXL - spacingM,
      ),
      child: Container(
        height: spacingXL - spacingM,
        padding: py2 + px3 + px2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(spacingL),
          color: _getPillBackgroundColor(),
        ),
        child: _pillWidget(),
      ),
    );
  }

  Widget _pillWidget() {
    return Wrap(
      children: [
        Text(
          pillCount,
          style: TextStyle(
            color: _getPillCountTextColor(),
            fontSize: fontSize12,
            fontWeight: FontWeight.bold,
            height: 1.3,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Color _getPillBackgroundColor() {
    switch (pillAppearance) {
      case PillAppearance.jal:
        return isSolid ? primary : primaryLightest;
      case PillAppearance.stone:
        return isSolid ? secondaryLight : secondaryLight;
      case PillAppearance.neem:
        return isSolid ? success : successLightest;
      case PillAppearance.haldi:
        return isSolid ? warning : warningLightest;
      case PillAppearance.mirch:
        return isSolid ? alert : alertLightest;
      case PillAppearance.tawak:
        return isSolid ? accent1 : accent1Lightest;
      case PillAppearance.nimbu:
        return isSolid ? accent4 : accent4Lightest;
      case PillAppearance.neel:
        return isSolid ? accent3 : accent3Lightest;
      case PillAppearance.jamun:
        return isSolid ? accent2 : accent2Lightest;
      default:
        return primary;
    }
  }

  Color _getPillCountTextColor() {
    switch (pillAppearance) {
      case PillAppearance.jal:
        return isSolid ? ColorToken.white : primaryDark;
      case PillAppearance.stone:
        return isSolid ? inverse : inverse;
      case PillAppearance.neem:
        return isSolid ? ColorToken.white : successDark;
      case PillAppearance.haldi:
        return isSolid ? warningDarker : warningDarker;
      case PillAppearance.mirch:
        return isSolid ? ColorToken.white : alertDark;
      case PillAppearance.tawak:
        return isSolid ? ColorToken.white : accent1Darker;
      case PillAppearance.nimbu:
        return isSolid ? accent4Darker : accent4Darker;
      case PillAppearance.neel:
        return isSolid ? ColorToken.white : accent3Dark;
      case PillAppearance.jamun:
        return isSolid ? ColorToken.white : accent2Dark;
      default:
        return ColorToken.white;
    }
  }

  bool get isSolid => pillType == PillType.solid;
}
