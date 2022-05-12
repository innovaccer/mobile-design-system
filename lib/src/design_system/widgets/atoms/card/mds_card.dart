import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';
import 'package:innovaccer_design_system/src/design_system/widgets/miscellaneous/custom_splash_factory.dart';

class MDSCard extends StatelessWidget with ColorMixin, SpacingMixin {
  // Body widget to show between header and footer
  final Widget? body;

  // [isFlatCard] is used to enable/disable shadows in card
  final bool isFlatCard;

  // [title] will be shown inside header
  final String? title;

  // [title] will be shown inside header
  final String? subTitle;

  // [subTitlePrefixIcon] will be shown inside header before subtitle
  final IconData? subTitlePrefixIcon;

  // To show [subTitle] on top of [title]
  final bool isSubTitleOnTop;

  final IconData? headerSuffixIcon;
  final Function? onHeaderSuffixIconTap;

  // [footerLabelText] will be shown only if there are no actions in footer
  final String? footerLabelText;

  // [onFooterTap] will be used only if there are no actions in footer
  final Function()? onFooterTap;

  // [footerPrefixIcon] will be shown only if there are no actions in footer
  final IconData? footerPrefixIcon;

  // [footerSuffixIcon] will be shown only if there are no actions in footer
  final IconData? footerSuffixIcon;

  // [actionText1] will be given priority over [footerLabelText]
  final String? actionText1;

  // Callback function for [actionText1]
  final Function? onAction1Tap;

  // [actionText2] will be given priority over [footerLabelText]
  final String? actionText2;

  // Callback function for [actionText2]
  final Function? onAction2Tap;

  // Custom footer widget
  // if this widget is passed it will override predefined footer
  final Widget? footer;

  // A media widget to show on the top of header in card
  final Widget? mediaWidgetOnTop;

  MDSCard({
    this.body,
    this.isFlatCard = false,
    this.title,
    this.subTitle,
    this.isSubTitleOnTop = false,
    this.subTitlePrefixIcon,
    this.footerLabelText,
    this.onFooterTap,
    this.footerPrefixIcon,
    this.footerSuffixIcon,
    this.headerSuffixIcon,
    this.onHeaderSuffixIconTap,
    this.actionText1,
    this.actionText2,
    this.onAction1Tap,
    this.onAction2Tap,
    this.mediaWidgetOnTop,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(spacing1),
        child: _cardContent(),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing1),
        border: isFlatCard
            ? Border.all(
                width: spacing0_5,
                style: BorderStyle.solid,
                color: secondaryLight,
              )
            : null,
        boxShadow: isFlatCard
            ? []
            : [
                BoxShadow(
                  color: shadowColor,
                  blurRadius: spacing1,
                  offset: Offset(noSpacing, spacing0_5),
                  spreadRadius: noSpacing,
                ),
              ],
        color: ColorToken.white,
      ),
    );
  }

  Widget _cardContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (mediaWidgetOnTop != null) ...[
          mediaWidgetOnTop!,
        ],
        if (_showHeader) ...[_header()],
        Visibility(
          visible: body != null,
          child: Padding(
            padding: _showHeader ? px4 + pb4 : p4,
            child: body,
          ),
        ),
        if (footer != null) ...[
          if (_showHeader || body != null) ...[
            Divider(
              height: spacing0_5,
              color: secondaryLight,
            ),
          ],
          footer!,
        ],
        if ((_showActionsInFooter || _showLabelInFooter) && footer == null) ...[
          if (_showHeader || body != null) ...[
            Divider(
              height: spacing0_5,
              color: secondaryLight,
            ),
          ],
          _footer(),
        ],
      ],
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Padding(
            padding:
                headerSuffixIcon != null ? pl4 + py4 + pr1 : pl4 + py4 + pr4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isSubTitleOnTop && _showSubTitle) ...[
                  _subTitleWidget(),
                  SizedBox(
                    height: spacing0_5,
                  ),
                ],
                Flexible(
                  child: MDSHeadline(
                    title!,
                  ),
                ),
                if (!isSubTitleOnTop && _showSubTitle) ...[
                  SizedBox(
                    height: spacing0_5,
                  ),
                  _subTitleWidget(),
                ],
              ],
            ),
          ),
        ),
        if (headerSuffixIcon != null) ...[
          Padding(
            padding: py1 + py0_5 + pr1,
            child: MDSIconButton(
              icon: headerSuffixIcon!,
              type: IconButtonType.transparent,
              onTap: onHeaderSuffixIconTap,
            ),
          ),
        ],
      ],
    );
  }

  Widget _subTitleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (subTitlePrefixIcon != null) ...[
          Icon(
            subTitlePrefixIcon,
            color: inverseLighter,
            size: spacing4,
          ),
          SizedBox(
            width: spacing1_5,
          ),
        ],
        Flexible(
          child: MDSFootnote(
            subTitle!,
            appearance: FootnoteAppearance.subtle,
          ),
        ),
      ],
    );
  }

  Widget _footer() {
    if (_showActionsInFooter) {
      return Padding(
        padding: px12 + py1 + py0_5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (actionText1 != null && actionText1!.isNotEmpty) ...[
              Flexible(
                child: MDSLabelButton(
                  title: actionText1,
                  onTap: onAction1Tap,
                ),
              ),
            ],
            Visibility(
              visible: actionText1 != null &&
                  actionText1!.isNotEmpty &&
                  actionText2 != null &&
                  actionText2!.isNotEmpty,
              child: SizedBox(
                width: spacing2,
              ),
            ),
            if (actionText2 != null && actionText2!.isNotEmpty) ...[
              Flexible(
                child: MDSLabelButton(
                  title: actionText2,
                  onTap: onAction2Tap,
                ),
              ),
            ],
          ],
        ),
      );
    }

    return Ink(
      child: Material(
        color: ColorToken.transparent,
        shadowColor: ColorToken.transparent,
        animationDuration: Duration(seconds: 0),
        child: InkWell(
          onTap: onFooterTap,
          hoverColor: secondaryLighter,
          splashColor: secondaryLighter,
          overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> materialStates) {
            return secondaryLighter;
          }),
          highlightColor: secondaryLighter,
          splashFactory: CustomSplash.splashFactory,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Padding(
                  padding: pl4 + py4 + py1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (footerPrefixIcon != null) ...[
                        Icon(
                          footerPrefixIcon,
                          color: inverseLighter,
                          size: spacing2,
                        ),
                        SizedBox(
                          width: spacing1_5,
                        ),
                      ],
                      Flexible(
                        child: Padding(
                          padding: footerSuffixIcon != null ? pr1 : pr4,
                          child: MDSFootnote(
                            footerLabelText!,
                            appearance: FootnoteAppearance.subtle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (footerSuffixIcon != null) ...[
                Padding(
                  padding: py1 + py0_5 + pr1,
                  child: MDSIconButton(
                    icon: footerSuffixIcon!,
                    type: IconButtonType.transparent,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  bool get _showSubTitle => (subTitle != null && subTitle!.isNotEmpty);
  bool get _showHeader => (title != null && title!.isNotEmpty);
  bool get _showActionsInFooter =>
      ((actionText1 != null && actionText1!.isNotEmpty) ||
          (actionText2 != null && actionText2!.isNotEmpty));
  bool get _showLabelInFooter =>
      (footerLabelText != null && footerLabelText!.isNotEmpty);
}
