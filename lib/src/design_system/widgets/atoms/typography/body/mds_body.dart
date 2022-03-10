import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/src/design_system/widgets/atoms/typography/scaler/text_scaler.dart';
import 'package:innovaccer_design_system/src/theme/mixin/color_mixin.dart';
import 'package:innovaccer_design_system/src/theme/mixin/font_mixin.dart';

enum BodyAppearance {
  /// cannot call it default as it is keyword
  defaultType,
  disabled,
  error,
  medium,
  strong,
  subtle,
}

class MDSBody extends StatelessWidget with ColorMixin, FontMixin {
  final BodyAppearance? appearance;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final String text;
  final Color? color;

  MDSBody(
    this.text, {
    this.appearance = BodyAppearance.defaultType,
    this.textAlign,
    this.maxLines,
    this.textOverflow,
    this.color,
  })  : assert(text.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return _getTextWidget(
      context,
      textStyle: _getStyle(),
    );
  }

  Widget copyWith(
    BuildContext context, {
    FontWeight? fontWeight,
    double? fontSize,
    List<Shadow>? shadows,
    double? fontLineHeight,
    double? letterSpacing,
  }) {
    // ignore: unnecessary_null_comparison
    assert(context != null);
    return _getTextWidget(
      context,
      fontLineHeight: fontLineHeight,
      fontSize: fontSize,
      textStyle: _getStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: shadows,
        letterSpacing: letterSpacing,
      ),
    );
  }

  Widget _getTextWidget(
    BuildContext context, {
    required TextStyle textStyle,
    double? fontLineHeight,
    double? fontSize,
  }) {
    // double _textScaleFactor = 1.0;
    // if (TextScaler.of<TextScalingFactor>(context) != null) {
    //   _textScaleFactor = TextScaler.of<TextScalingFactor>(context).scaleFactor;
    // }
    // TODO: check if [TextScaler.of<TextScalingFactor>(context)] can be null
    double _textScaleFactor = TextScaler.of<TextScalingFactor>(context).scaleFactor;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: ((fontLineHeight ?? fontLineHeight24) -
                  (fontSize ?? fontSize17)) /
              2),
      child: Text(
        text,
        style: textStyle,
        textAlign: textAlign ?? TextAlign.left,
        maxLines: maxLines,
        overflow: textOverflow,
        textScaleFactor: _textScaleFactor,
      ),
    );
  }

  TextStyle _getStyle({
    double? fontSize,
    FontWeight? fontWeight,
    List<Shadow>? shadows,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: fontSize ?? fontSize17,
      fontWeight: fontWeight ?? _fontWeightMapping[appearance],
      color: color ?? _fontColorMapping[appearance],
      letterSpacing: letterSpacing ?? letterSpacing1,
      shadows: shadows,
    );
  }

  Map<BodyAppearance, Color> get _fontColorMapping => {
        BodyAppearance.defaultType: inverse,
        BodyAppearance.disabled: inverseLightest,
        BodyAppearance.error: alert,
        BodyAppearance.medium: inverse,
        BodyAppearance.strong: inverse,
        BodyAppearance.subtle: inverseLighter
      };

  Map<BodyAppearance, FontWeight> get _fontWeightMapping => {
        BodyAppearance.defaultType: FontWeight.w400,
        BodyAppearance.disabled: FontWeight.w500,
        BodyAppearance.error: FontWeight.w400,
        BodyAppearance.medium: FontWeight.w500,
        BodyAppearance.strong: FontWeight.w700,
        BodyAppearance.subtle: FontWeight.w500
      };
}
