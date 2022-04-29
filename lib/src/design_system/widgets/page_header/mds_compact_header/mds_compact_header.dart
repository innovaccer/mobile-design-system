import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innovaccer_design_system/src/design_system/utils/page_header_mixin.dart';

import '../../../../../innovaccer_design_system.dart';

class MDSCompactPageHeader extends StatefulWidget {
  final bool? isPageModal;
  final bool isCompactHeader;
  final String heading;
  final String subHeading;
  final String actionButtonText;
  final Function? actionButtonTextCallback;
  final Function? backButtonCallback;
  final Widget? body;
  final List<MDSIconButton>? listOfActionIcons;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const MDSCompactPageHeader(
      {Key? key,
      required this.heading,
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
            (listOfActionIcons == null && (actionButtonText == '') ||
                (listOfActionIcons == null && actionButtonText != '') ||
                (listOfActionIcons != null && (actionButtonText == ''))),
            'Can not provide both listOfActionIcons and actionButtonText together');

  @override
  _PageHeaderScreenState createState() => _PageHeaderScreenState();
}

class _PageHeaderScreenState extends State<MDSCompactPageHeader> with SpacingMixin, ColorMixin, FontMixin, PageHeaderMixin {
  @override
  void initState() {
    super.initState();
    if (Navigator.canPop(context)) {
      showBackButton = true;
    }
    maxAppBarHeightWithSubheading = spacing16 + spacing11;
    maxAppBarHeightWithoutSubheading = spacing16 + spacing6;
    preferredSize = spacing4;
    headerPositionFromTop = widget.subHeading.isNotEmpty ? spacing0_5 : spacing2;
    headingFontSize = widget.subHeading.isNotEmpty ? 17 : 22;
    headerPositionFromLeft = spacing14 - spacing1;
    headingFontWeight = FontWeight.w600;
    appBarColor = ColorToken.white;
    subHeadingFontSize = fontSize13;
    subHeadingFontWeight = FontWeight.w600;
    subHeadingLineHeight = fontLineHeight16;
    headingLineHeight = widget.subHeading.isNotEmpty ? fontLineHeight24 : fontLineHeight28;
    headingLetterSpacing = letterSpacing1;
    subHeadingLetterSpacing = letterSpacing3;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: appBarColor,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            key: widget.scaffoldKey,
            backgroundColor: widget.isPageModal! ? ColorToken.white : secondaryLightest,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(maxAppBarHeightWithSubheading!),
              child: Container(
                height: preferredSize,
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
                    Positioned(
                      top: headerPositionFromTop,
                      left: showBackButton ? headerPositionFromLeft : spacing2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: headingLineHeight,
                            child: Center(
                              child: Text(
                                widget.heading,
                                style: TextStyle(
                                  fontSize: headingFontSize,
                                  color: ColorToken.black,
                                  fontWeight: headingFontWeight,
                                  letterSpacing: headingLetterSpacing,
                                  // height:headingLineHeight/headingFontSize,
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: widget.subHeading.isNotEmpty,
                            child: Container(
                              height: subHeadingLineHeight,
                              padding: pt0_5,
                              child: Center(
                                child: Text(
                                  widget.subHeading,
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
    if (widget.actionButtonText.isNotEmpty) {
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
}
