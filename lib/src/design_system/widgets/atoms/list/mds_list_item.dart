import 'package:flutter/material.dart';

import '../../../../../innovaccer_design_system.dart';

class MDSListItem extends StatelessWidget with ColorMixin, SpacingMixin, FontMixin {
  final String? primaryText;
  final String? secondaryText;
  final String? tertiaryText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final bool? showDivider;

  MDSListItem({
    required this.primaryText,
    this.secondaryText,
    this.tertiaryText,
    this.suffixWidget,
    this.prefixWidget,
    this.showDivider = true,
  }) : assert(
            ((tertiaryText == null && secondaryText == null) ||
                (tertiaryText == null && secondaryText != null) ||
                (tertiaryText != null && secondaryText != null)),
            'secondaryText is null when using tertiaryText');

  @override
  Widget build(BuildContext context) {
    /// this wrapped with container so that GestureDetector
    /// can be identified on whole item not just on the
    /// visible item
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: pl4 + pt4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            prefixWidget != null
                ? Padding(
                    padding: pr2,
                    child: prefixWidget,
                  )
                : Container(),
            prefixWidget != null
                ? SizedBox(
                    width: spacing2,
                  )
                : Container(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            primaryText != null && primaryText!.trim().isNotEmpty
                                ? MDSBody(
                                    primaryText!,
                                    maxLines: 2,
                                    textOverflow: TextOverflow.ellipsis,
                                  )
                                : Container(),
                            secondaryText != null && secondaryText!.trim().isNotEmpty
                                ? Padding(
                                    padding: pt0_5,
                                    child: MDSSubhead(
                                      secondaryText!,
                                      appearance: SubheadAppearance.subtle,
                                      maxLines: 2,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : Container(),
                            tertiaryText != null && tertiaryText!.trim().isNotEmpty
                                ? Padding(
                                    padding: pt1,
                                    child: MDSFootnote(
                                      tertiaryText!,
                                      appearance: FootnoteAppearance.subtle,
                                      maxLines: 2,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      suffixWidget != null
                          ? Padding(
                              padding: pl2 + pr4,
                              child: suffixWidget,
                            )
                          : Container(),
                    ],
                  ),
                  Padding(
                    padding: pt4,
                    child: showDivider!
                        ? Divider(
                            thickness: spacing0_5,
                            height: 0,
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
