import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/src/design_system/widgets/atoms/typography/scaler/text_scaler.dart';
import 'package:innovaccer_design_system/src/theme/mixin/color_mixin.dart';
import 'package:innovaccer_design_system/src/theme/mixin/font_mixin.dart';

enum FootnoteAppearance {
  /// cannot call it default as it is keyword
  defaultType,
  disabled,
  error,
  medium,
  strong,
  subtle,
}

class MDSFootnote extends StatelessWidget with ColorMixin, FontMixin {
  final FootnoteAppearance? appearance;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final String text;

  MDSFootnote(
    this.text, {
    this.appearance,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return Container();
    }

    double? _textScaleFactor = 1.0;
    // ignore: unnecessary_null_comparison
    if (TextScaler.of<TextScalingFactor>(context) != null) {
      _textScaleFactor = TextScaler.of<TextScalingFactor>(context)?.scaleFactor;
    }

    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: (fontLineHeight16 - fontSize13) / 2),
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
      fontSize: fontSize13,
      fontWeight: _fontWeightMapping[appearance],
      color: _fontColorMapping[appearance],
      letterSpacing: letterSpacing3,
    );
  }

  Map<FootnoteAppearance, Color> get _fontColorMapping => {
        FootnoteAppearance.defaultType: inverse,
        FootnoteAppearance.disabled: inverseLightest,
        FootnoteAppearance.error: alert,
        FootnoteAppearance.medium: inverse,
        FootnoteAppearance.strong: inverse,
        FootnoteAppearance.subtle: inverseLighter
      };

  Map<FootnoteAppearance, FontWeight> get _fontWeightMapping => {
        FootnoteAppearance.defaultType: FontWeight.w500,
        FootnoteAppearance.disabled: FontWeight.w600,
        FootnoteAppearance.error: FontWeight.w500,
        FootnoteAppearance.medium: FontWeight.w600,
        FootnoteAppearance.strong: FontWeight.w700,
        FootnoteAppearance.subtle: FontWeight.w600
      };
}
