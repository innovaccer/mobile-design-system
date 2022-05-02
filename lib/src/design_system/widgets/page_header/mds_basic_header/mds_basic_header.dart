import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';
import 'package:innovaccer_design_system/src/design_system/utils/page_header_mixin.dart';


class MDSBasicPageHeader extends StatefulWidget {
  final String? heading;

  /// [controller] is needed for scrolling animation
  final ScrollController? controller;
  final Widget? body;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  MDSBasicPageHeader({
    Key? key,
    required this.heading,
    this.controller,
    this.body,
    this.scaffoldKey,
  });

  @override
  _PageHeaderScreenState createState() => _PageHeaderScreenState();
}

class _PageHeaderScreenState extends State<MDSBasicPageHeader> with SpacingMixin, ColorMixin, FontMixin, PageHeaderMixin {
  @override
  void initState() {
    super.initState();
    maxAppBarHeightWithSubheading = spacing16 + spacing11;
    maxAppBarHeightWithoutSubheading = spacing16 + spacing5 - spacing0_5;
    preferredSize = maxAppBarHeightWithoutSubheading;
    headerPositionFromTop = spacing11 - spacing0_5;
    headingFontSize = fontSize34;
    headingFontWeight = FontWeight.w700;
    appBarColor = secondaryLightest;
    headingLineHeight = fontLineHeight36 + spacing0_5;
    headingLetterSpacing = letterSpacing7;
    if (widget.controller != null) {
      widget.controller?.addListener(() {
        if (mounted) {
          ///Compact Header Position
          if (widget.controller?.position.userScrollDirection == ScrollDirection.reverse) {
            if (isCompactHeader) {
              setState(() {
                headerPositionFromTop = spacing2;
                headingFontSize = 22;
                headingFontWeight = FontWeight.w600;
                preferredSize = spacing4;
                appBarColor = ColorToken.white;
                headingLineHeight = fontLineHeight28;
                headingLetterSpacing = letterSpacing1;
              });
            }
          }

          ///Prominent Header Position
          if (widget.controller?.position.userScrollDirection == ScrollDirection.forward) {
            if (widget.controller!.position.atEdge) {
              if (widget.controller?.position.pixels == 0) {
                if (isProminentHeader) {
                  setState(() {
                    headerPositionFromTop = spacing11 - spacing0_5;
                    headingFontSize = fontSize34;
                    headingFontWeight = FontWeight.w700;
                    appBarColor = secondaryLightest;
                    headingLineHeight = fontLineHeight36 + spacing0_5;
                    headingLetterSpacing = letterSpacing7;
                    preferredSize = maxAppBarHeightWithoutSubheading;
                  });
                }
              }
            }
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: AnimatedContainer(
        duration: Duration(milliseconds: animationDuration),
        color: appBarColor,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            key: widget.scaffoldKey,
            backgroundColor: ColorToken.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(maxAppBarHeightWithSubheading!),
              child: AnimatedContainer(
                height: preferredSize,
                duration: Duration(milliseconds: animationDuration),
                decoration: BoxDecoration(
                    color: appBarColor,
                    border: Border(
                      bottom: BorderSide(
                        color: secondary,
                        width: 1.0,
                      ),
                    )),
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      duration: Duration(milliseconds: animationDuration),
                      curve: Curves.linear,
                      top: headerPositionFromTop,
                      left: spacing2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: animationDuration),
                            height: headingLineHeight,
                            child: Center(
                              child: AnimatedDefaultTextStyle(
                                duration: Duration(milliseconds: animationDuration),
                                style: TextStyle(
                                  fontSize: headingFontSize,
                                  color: ColorToken.black,
                                  fontWeight: headingFontWeight,
                                  letterSpacing: headingLetterSpacing,
                                  // height:headingLineHeight/headingFontSize,
                                ),
                                child: Text(widget.heading!),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: widget.body,
          ),
        ),
      ),
    );
  }

  bool get isCompactHeader => (headingFontWeight != FontWeight.w600 &&
      preferredSize != spacing4 &&
      appBarColor != ColorToken.white &&
      headingLetterSpacing != letterSpacing1);

  bool get isProminentHeader => (headerPositionFromTop != spacing11 - spacing0_5 &&
      headingFontSize != fontSize28 &&
      headingFontWeight != FontWeight.w700 &&
      appBarColor != secondaryLightest &&
      headingLineHeight != fontLineHeight36 + spacing0_5 &&
      headingLetterSpacing != letterSpacing7);
}
