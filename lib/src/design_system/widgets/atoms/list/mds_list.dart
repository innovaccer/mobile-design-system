import 'package:flutter/material.dart';

import '../../../../../innovaccer_design_system.dart';

class MDSList extends StatefulWidget {
  /// length of list
  final int? length;

  /// item builder which takes GestureDetector as parent and MDSItem as child of GestureDetector
  final GestureDetector Function(BuildContext, int) itemBuilder;

  /// header shown at top-left of list
  final String? sectionHeading;

  /// method is called when leftHeader is tapped
  final Function? sectionHeadingOnClick;

  /// header shown at top-right of list
  final String? sectionHeadingAction;

  /// method is called when rightHeader is tapped
  final Function? sectionHeadingActionOnClick;

  /// ScrollController
  final ScrollController? scrollController;

  /// Scroll Physics
  final ScrollPhysics? scrollPhysics;

  MDSList({
    required this.length,
    required this.itemBuilder,
    this.sectionHeading,
    this.sectionHeadingAction,
    this.sectionHeadingOnClick,
    this.sectionHeadingActionOnClick,
    this.scrollController,
    this.scrollPhysics,
  });

  @override
  State<MDSList> createState() => _MDSListState();
}

class _MDSListState extends State<MDSList> with ColorMixin, SpacingMixin, FontMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// leftHeader
            widget.sectionHeading != null && widget.sectionHeading!.trim().isNotEmpty
                ? GestureDetector(
                    onTap: () => widget.sectionHeadingOnClick!,
                    child: Padding(
                      padding: p6,
                      child: MDSBody(
                        widget.sectionHeading!,
                        appearance: BodyAppearance.strong,
                      ),
                    ),
                  )
                : Container(),

            /// rightHeader
            widget.sectionHeadingAction != null && widget.sectionHeadingAction!.trim().isNotEmpty
                ? GestureDetector(
                    onTap: () => widget.sectionHeadingActionOnClick,
                    child: Padding(
                      padding: p6,
                      child: MDSLink(
                        widget.sectionHeadingAction!,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: ColorToken.white,
              border: Border(
                top: BorderSide(
                  color: inverseLighter,
                  width: .2,
                ),
                bottom: BorderSide(
                  color: inverseLightest,
                  width: .2,
                ),
              ),
            ),
            child: ListView.builder(
              controller: widget.scrollController,
              physics: widget.scrollPhysics ?? ClampingScrollPhysics(),
              itemCount: widget.length,
              shrinkWrap: true,
              padding: p0,
              itemBuilder: widget.itemBuilder,
            ),
          ),
        ),
      ],
    );
  }
}
