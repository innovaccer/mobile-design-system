import 'package:innovaccer_design_system/src/design_system/widgets/atoms/typography/scaler/text_scaler.dart'
    as t;
import 'package:flutter/material.dart';
import '';
import 'package:innovaccer_design_system/src/theme/mixin/color_mixin.dart';
import 'package:innovaccer_design_system/src/theme/mixin/font_mixin.dart';

import '../../../../../../innovaccer_design_system.dart';

class MDSLink extends StatelessWidget with ColorMixin, FontMixin {
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final String text;
  final bool useDefaultTextColor;
  final String? semanticsLabel;
  MDSLink(
    this.text, {
    this.textAlign,
    this.maxLines,
    this.textOverflow,
    this.useDefaultTextColor = false,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return Container();
    }

    double? _textScaleFactor = 1.0;
    // ignore: unnecessary_null_comparison
    // if (TextScaler.of<TextScalingFactor>(context) != null) {
    //   _textScaleFactor = TextScaler.of<TextScalingFactor>(context)?.scaleFactor;
    // }

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
        semanticsLabel: semanticsLabel,
      ),
    );
  }

  TextStyle _getStyle() {
    return TextStyle(
      fontSize: fontSize15,
      fontWeight: FontWeight.w500,
      color: useDefaultTextColor ? null : primary,
    );
  }
}
