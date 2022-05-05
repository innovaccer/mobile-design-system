import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:innovaccer_design_system/src/design_system/utils/page_header_mixin.dart';

import '../../../../../innovaccer_design_system.dart';

class MDSPageHeaderWithSubheading extends StatefulWidget {
  final bool? isPageModal;
  final bool? isCompactHeader;
  final String? heading;
  final String? subHeading;
  final String? actionButtonText;
  final Function? actionButtonTextCallback;
  final Function? backButtonCallback;

  /// [controller] is needed for scrolling animation
  final ScrollController? controller;
  final Widget? body;
  final List<MDSIconButton>? listOfActionIcons;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const MDSPageHeaderWithSubheading(
      {Key? key,
      required this.heading,
      this.controller,
      this.subHeading = '',
      this.actionButtonText = '',
      this.isPageModal = true,
      this.actionButtonTextCallback,
      this.backButtonCallback,
      this.body,
      this.isCompactHeader = false,
      this.listOfActionIcons,
      this.scaffoldKey})
      : assert(
            (listOfActionIcons == null && (actionButtonText == null || actionButtonText == '') ||
                (listOfActionIcons == null && actionButtonText != null && actionButtonText != '') ||
                (listOfActionIcons != null && (actionButtonText == null || actionButtonText == ''))),
            'Can not provide both listOfActionIcons and actionButtonText together'),
        assert((heading != null), 'heading can not be null');

  @override
  _PageHeaderScreenState createState() => _PageHeaderScreenState();
}

class _PageHeaderScreenState extends State<MDSPageHeaderWithSubheading>
    with SpacingMixin, ColorMixin, FontMixin, PageHeaderMixin {
  @override
  void initState() {
    super.initState();
    if (Navigator.canPop(context)) {
      showBackButton = true;
    }
    maxAppBarHeightWithSubheading = spacing16 + spacing11;
    maxAppBarHeightWithoutSubheading = spacing16 + spacing6;
    if (widget.subHeading != null && widget.subHeading!.isNotEmpty) {
      preferredSize = maxAppBarHeightWithSubheading;
    } else {
      preferredSize = maxAppBarHeightWithoutSubheading;
    }
    headerPositionFromTop = spacing11 - spacing0_5;
    headerPositionFromLeft = spacing2;
    headingFontSize = showBackButton ? fontSize28 : fontSize34;
    headingFontWeight = FontWeight.w700;
    appBarColor = secondaryLightest;
    subHeadingFontSize = fontSize15;
    subHeadingFontWeight = FontWeight.w500;
    subHeadingLineHeight = fontSize20 + spacing0_5;
    headingLineHeight = fontLineHeight36 + spacing0_5;
    headingLetterSpacing = letterSpacing7;
    subHeadingLetterSpacing = letterSpacing2;
    if (widget.controller != null) {
      widget.controller!.addListener(() {
        if (mounted) {
          ///Compact Header Position
          if (widget.controller!.position.userScrollDirection == ScrollDirection.reverse) {
            if (isCompactHeader) {
              setState(() {
                headerPositionFromTop = widget.subHeading!.isNotEmpty ? spacing0_5 : spacing2;
                headingFontSize = widget.subHeading!.isNotEmpty ? 17 : 22;
                headerPositionFromLeft = spacing14 - spacing1;
                headingFontWeight = FontWeight.w600;
                preferredSize = spacing4;
                appBarColor = ColorToken.white;
                subHeadingFontSize = fontSize13;
                subHeadingFontWeight = FontWeight.w600;
                subHeadingLineHeight = fontLineHeight16;
                headingLineHeight = widget.subHeading!.isNotEmpty ? fontLineHeight24 : fontLineHeight28;
                headingLetterSpacing = letterSpacing1;
                subHeadingLetterSpacing = letterSpacing3;
              });
            }
          }

          ///Prominent Header Position
          if (widget.controller!.position.userScrollDirection == ScrollDirection.forward) {
            if (widget.controller!.position.atEdge) {
              if (widget.controller!.position.pixels == 0) {
                if (isProminentHeader) {
                  setState(() {
                    headerPositionFromTop = spacing11 - spacing0_5;
                    headerPositionFromLeft = spacing2;
                    headingFontSize = showBackButton ? fontSize28 : fontSize34;
                    headingFontWeight = FontWeight.w700;
                    appBarColor = secondaryLightest;
                    subHeadingFontSize = fontSize15;
                    subHeadingFontWeight = FontWeight.w500;
                    subHeadingLineHeight = fontLineHeight20 + spacing0_5;
                    headingLineHeight = fontLineHeight36 + spacing0_5;
                    headingLetterSpacing = letterSpacing7;
                    subHeadingLetterSpacing = letterSpacing2;
                    if (widget.subHeading != null && widget.subHeading!.isNotEmpty) {
                      preferredSize = maxAppBarHeightWithSubheading;
                    } else {
                      preferredSize = maxAppBarHeightWithoutSubheading;
                    }
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
            backgroundColor: widget.isPageModal! ? ColorToken.white : secondaryLightest,
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
                    suffixWidget(),
                    Visibility(
                      visible: showBackButton,
                      child: Padding(
                        padding: pl0_5,
                        child: MDSIconButton(
                          onTap: () {
                            widget.backButtonCallback ?? Navigator.pop(context);
                          },
                          type: IconButtonType.transparent,
                          icon: widget.isPageModal! ? Icons.arrow_back : Icons.close,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: animationDuration),
                      curve: Curves.linear,
                      top: headerPositionFromTop,
                      left: showBackButton ? headerPositionFromLeft : spacing2,
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
                          Visibility(
                            visible: widget.subHeading!.isNotEmpty,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: animationDuration),
                              height: subHeadingLineHeight,
                              padding: pt0_5,
                              child: Center(
                                child: AnimatedDefaultTextStyle(
                                  duration: Duration(milliseconds: animationDuration),
                                  child: Text(widget.subHeading!),
                                  style: TextStyle(
                                    fontWeight: subHeadingFontWeight,
                                    fontSize: subHeadingFontSize,
                                    color: inverseLighter,
                                    letterSpacing: subHeadingLetterSpacing,
                                    //  height: subHeadingLineHeight/subHeadingFontSize,
                                  ),
                                ),
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

  /// Widget for showing label, icons or menu icon
  Widget suffixWidget() {
    Widget? suffixWidget;
    if (widget.actionButtonText!.isNotEmpty) {
      suffixWidget = Padding(
        padding: pr2,
        child: MDSLabelButton(
          onTap: () => widget.actionButtonTextCallback,
          title: widget.actionButtonText,
        ),
      );
    } else if (widget.listOfActionIcons != null) {
      if (widget.listOfActionIcons!.length > 2) {
        suffixWidget = Padding(
          padding: pr2 + pr0_5,
          child: MDSIconButton(
            onTap: () {},
            icon: Icons.more_horiz,
          ),
        );
      } else {
        suffixWidget = Padding(
          padding: pr2 + pr0_5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.listOfActionIcons!.isNotEmpty ? widget.listOfActionIcons! : [],
          ),
        );
      }
    }
    return Align(alignment: Alignment.topRight, child: suffixWidget);
  }

  bool get isCompactHeader => (headerPositionFromLeft != spacing14 - spacing1 &&
      headerPositionFromLeft != spacing14 - spacing1 &&
      headingFontWeight != FontWeight.w600 &&
      preferredSize != spacing4 &&
      appBarColor != ColorToken.white &&
      subHeadingFontSize != fontSize13 &&
      subHeadingFontWeight != FontWeight.w600 &&
      subHeadingLineHeight != fontLineHeight16 &&
      headingLetterSpacing != letterSpacing1 &&
      subHeadingLetterSpacing != letterSpacing3);

  bool get isProminentHeader => (headerPositionFromLeft != spacing2 &&
      headerPositionFromTop != spacing11 - spacing0_5 &&
      headingFontSize != fontSize28 &&
      headingFontWeight != FontWeight.w700 &&
      appBarColor != secondaryLightest &&
      subHeadingFontSize != fontSize15 &&
      subHeadingFontWeight != FontWeight.w500 &&
      subHeadingLineHeight != fontLineHeight20 + spacing0_5 &&
      headingLineHeight != fontLineHeight36 + spacing0_5 &&
      headingLetterSpacing != letterSpacing7 &&
      subHeadingLetterSpacing != letterSpacing2);
}
