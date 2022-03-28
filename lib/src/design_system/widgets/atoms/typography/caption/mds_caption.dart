import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/src/design_system/widgets/atoms/typography/scaler/text_scaler.dart';
import 'package:innovaccer_design_system/src/theme/mixin/color_mixin.dart';
import 'package:innovaccer_design_system/src/theme/mixin/font_mixin.dart';

enum CaptionType {
  caption1,
  caption2,
}

enum CaptionAppearance {
  /// cannot call it default as it is keyword
  defaultType,
  subtle,
}

class MDSCaption extends StatelessWidget with ColorMixin, FontMixin {
  final CaptionType type;
  final CaptionAppearance appearance;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final String text;

  MDSCaption(
    this.text, {
    this.type = CaptionType.caption1,
    this.appearance = CaptionAppearance.defaultType,
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
    double verticalPadding =
        ((_fontLineHeightMapping[type]?[appearance] ?? fontLineHeight16) -
                (_fontSizeMapping[type]?[appearance] ?? fontSize12)) /
            2;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
      ),
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
      fontSize: _fontSizeMapping[type]?[appearance],
      fontWeight: _fontWeightMapping[type]?[appearance],
      color: _fontColorMapping[type]?[appearance],
      letterSpacing: _fontLetterSpacingMapping[type]?[appearance],
    );
  }

  Map<CaptionType, Map<CaptionAppearance, double>> get _fontSizeMapping => {
        CaptionType.caption1: {
          CaptionAppearance.defaultType: fontSize12,
          CaptionAppearance.subtle: fontSize12
        },
        CaptionType.caption2: {
          CaptionAppearance.defaultType: fontSize11,
          CaptionAppearance.subtle: fontSize11
        }
      };

  Map<CaptionType, Map<CaptionAppearance, FontWeight>> get _fontWeightMapping =>
      {
        CaptionType.caption1: {
          CaptionAppearance.defaultType: FontWeight.w500,
          CaptionAppearance.subtle: FontWeight.w600
        },
        CaptionType.caption2: {
          CaptionAppearance.defaultType: FontWeight.w500,
          CaptionAppearance.subtle: FontWeight.w600
        }
      };

  Map<CaptionType, Map<CaptionAppearance, Color>> get _fontColorMapping => {
        CaptionType.caption1: {
          CaptionAppearance.defaultType: inverse,
          CaptionAppearance.subtle: inverseLighter
        },
        CaptionType.caption2: {
          CaptionAppearance.defaultType: inverse,
          CaptionAppearance.subtle: inverseLighter
        }
      };

  Map<CaptionType, Map<CaptionAppearance, double>> get _fontLineHeightMapping =>
      {
        CaptionType.caption1: {
          CaptionAppearance.defaultType: fontLineHeight16,
          CaptionAppearance.subtle: fontLineHeight16
        },
        CaptionType.caption2: {
          CaptionAppearance.defaultType: fontLineHeight16,
          CaptionAppearance.subtle: fontLineHeight16
        }
      };

  Map<CaptionType, Map<CaptionAppearance, double>>
      get _fontLetterSpacingMapping => {
            CaptionType.caption1: {
              CaptionAppearance.defaultType: letterSpacing4,
              CaptionAppearance.subtle: letterSpacing4
            },
            CaptionType.caption2: {
              CaptionAppearance.defaultType: letterSpacing5,
              CaptionAppearance.subtle: letterSpacing5
            }
          };
}
