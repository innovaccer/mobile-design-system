import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/src/design_system/widgets/atoms/typography/scaler/text_scaler.dart';
import 'package:innovaccer_design_system/src/theme/mixin/color_mixin.dart';
import 'package:innovaccer_design_system/src/theme/mixin/font_mixin.dart';

enum SubheadAppearance {
  /// cannot call it default as it is keyword
  defaultType,
  disabled,
  error,
  medium,
  strong,
  subtle,
}

class MDSSubhead extends StatelessWidget with ColorMixin, FontMixin {
  final SubheadAppearance appearance;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final String text;

  MDSSubhead(
    this.text, {
    this.appearance = SubheadAppearance.defaultType,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return Container();
    }

    double _textScaleFactor = 1.0;
    // ignore: unnecessary_null_comparison
    if (TextScaler.of<TextScalingFactor>(context) != null) {
      _textScaleFactor = TextScaler.of<TextScalingFactor>(context).scaleFactor;
    }

    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: (fontLineHeight20 - fontSize15) / 2),
      child: Text(
        text,
        style: _getStyle(),
        textAlign: textAlign ?? TextAlign.left,
        maxLines: maxLines,
        overflow: textOverflow,
        textScaleFactor: _textScaleFactor,
      ),
    );
  }

  TextStyle _getStyle() {
    return TextStyle(
      fontSize: fontSize15,
      fontWeight: _fontWeightMapping[appearance],
      color: _fontColorMapping[appearance],
      letterSpacing: letterSpacing2,
    );
  }

  Map<SubheadAppearance, Color> get _fontColorMapping => {
        SubheadAppearance.defaultType: inverse,
        SubheadAppearance.disabled: inverseLightest,
        SubheadAppearance.error: alert,
        SubheadAppearance.medium: inverse,
        SubheadAppearance.strong: inverse,
        SubheadAppearance.subtle: inverseLighter
      };

  Map<SubheadAppearance, FontWeight> get _fontWeightMapping => {
        SubheadAppearance.defaultType: FontWeight.w400,
        SubheadAppearance.disabled: FontWeight.w500,
        SubheadAppearance.error: FontWeight.w400,
        SubheadAppearance.medium: FontWeight.w500,
        SubheadAppearance.strong: FontWeight.w700,
        SubheadAppearance.subtle: FontWeight.w500
      };
}
