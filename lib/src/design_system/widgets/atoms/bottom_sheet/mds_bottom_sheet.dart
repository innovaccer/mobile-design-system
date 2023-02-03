import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../innovaccer_design_system.dart';
import '../../miscellaneous/custom_bottom_sheet.dart' as custom_bottom_sheet;

class MDSBottomSheet with SpacingMixin, ColorMixin {
  Future<void> open({
    required BuildContext context,
    required String heading,
    required Widget child,
    String? subHeading,
    bool? dragHandle,
    Color? barrierColor,
    bool isDismissible = true,
  }) async {
    /// defaultMaxBottomSheetHeight is 60% height
    double defaultMaxBottomSheetHeight =
        MediaQuery.of(context).size.height * 0.60;

    /// defaultMaxBottomSheetHeight is 93% height
    double maxActionSheetScrollableHeight =
        MediaQuery.of(context).size.height * 0.93;

    /// removing the bottom padding if the bottom sheet is non-dismissible
    if (isDismissible) {
      defaultMaxBottomSheetHeight =
          defaultMaxBottomSheetHeight - MediaQuery.of(context).padding.bottom;
      maxActionSheetScrollableHeight = maxActionSheetScrollableHeight -
          MediaQuery.of(context).padding.bottom;
    }
    double childHeight = defaultMaxBottomSheetHeight;
    double headerHeight = 56;

    /// initial contentHeight is headerHeight and childHeight
    double contentHeight = headerHeight + childHeight;
    double heightContainer = defaultMaxBottomSheetHeight;

    await custom_bottom_sheet.showModalBottomSheet(
      context: context,
      backgroundColor: ColorToken.transparent,
      barrierColor: barrierColor,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: isDismissible,
      builder: (BuildContext actionSheetContext) {
        return StatefulBuilder(
          builder: (
            BuildContext actionSheetContext,
            StateSetter actionSheetSetState,
          ) {
            /// if defaultMaxBottomSheetHeight is larger than contentHeight
            /// then assigning height of widget as lowest value i.e. contentHeight here
            if (defaultMaxBottomSheetHeight > contentHeight) {
              heightContainer = contentHeight;
            }
            if (!isDismissible) {
              heightContainer += MediaQuery.of(context).padding.bottom;
            }
            return Container(
              decoration: _bottomSheetDecoration(isDismissible),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SafeArea(
                top: false,
                left: false,
                right: false,
                bottom: isDismissible,
                child: AnimatedContainer(
                  height: heightContainer,
                  decoration: _bottomSheetDecoration(isDismissible),
                  curve: Cubic(0.0, 0.0, 0.3, 1.0),
                  duration: Duration(milliseconds: 240),
                  child: GestureDetector(
                    /// onTap is to ignore onVerticalDragStart's onTap
                    /// because if tap is there then also onVerticalDragStart also gets triggered
                    /// if both onTap and onVerticalDragStart are there then they will behave separately
                    onTap: () {
                      /// if any textField is there and user taps outside it
                      /// then un-focusing the textField
                      FocusScope.of(context).requestFocus(FocusNode());
                    },

                    /// when dragHandle is swipe up and down
                    onVerticalDragStart: (v) {
                      /// if any textField is there and user taps outside it
                      /// then un-focusing the textField
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (contentHeight >= defaultMaxBottomSheetHeight &&
                          heightContainer == defaultMaxBottomSheetHeight) {
                        actionSheetSetState(() {
                          heightContainer = maxActionSheetScrollableHeight;
                        });
                      } else {
                        /// in this condition bringing back expanded 93% height to 60%
                        actionSheetSetState(() {
                          heightContainer = defaultMaxBottomSheetHeight;
                        });
                      }
                    },
                    child: NotificationListener<UserScrollNotification>(
                      onNotification: (val) {
                        /// if any textField is there and user taps outside it
                        /// then un-focusing the textField
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (val.direction == ScrollDirection.reverse) {
                          /// if scroll in up direction
                          /// if original contentHeight is more than 60% of screen
                          /// that means it can goes up to 93%
                          if (contentHeight >= defaultMaxBottomSheetHeight &&
                              heightContainer == defaultMaxBottomSheetHeight) {
                            actionSheetSetState(() {
                              heightContainer = maxActionSheetScrollableHeight;
                            });
                          }
                        } else if (val.direction == ScrollDirection.forward) {
                          /// if scroll up in down direction
                          /// in this condition bringing back expanded 93% height to 60%
                          if (val.metrics.pixels ==
                              val.metrics.minScrollExtent) {
                            actionSheetSetState(() {
                              heightContainer = defaultMaxBottomSheetHeight;
                            });
                          }
                        }
                        return true;
                      },
                      child: Container(
                        /// above container is given to make GestureDetector work on all white spaces
                        /// where bottomSheet's content is not there
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MeasureSize(
                              onChange: (size) {
                                actionSheetSetState(() {
                                  headerHeight = size!.height;
                                  contentHeight = headerHeight + childHeight;
                                });
                              },
                              child: _header(
                                actionSheetContext,
                                isDismissible,
                                heading,
                                subHeading,
                                dragHandle,
                              ),
                            ),
                            Flexible(
                              child: MeasureSize(
                                onChange: (size) {
                                  actionSheetSetState(() {
                                    childHeight = size!.height;
                                    contentHeight = headerHeight + childHeight;
                                  });
                                },
                                child: child,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  BoxDecoration _bottomSheetDecoration(bool isDismissible) {
    return BoxDecoration(
        color: ColorToken.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(spacing3),
            topRight: Radius.circular(spacing3)),
        boxShadow: !isDismissible
            ? [
                BoxShadow(
                    color: secondaryLight,
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3))
              ]
            : null);
  }

  Widget _header(BuildContext context, bool isDismissible, String heading,
      String? subHeading, bool? dragHandle) {
    return Column(
      children: [
        /// drag handle to update bottomSheet height
        dragHandle != null && dragHandle ? _dragHandleWidget() : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: pl4 + py4 + pr0_5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// heading of bottom sheet
                    if (heading.trim().isNotEmpty) MDSHeadline(heading),

                    /// subheading of bottom sheet
                    subHeading != null
                        ? MDSSubhead(
                            subHeading,
                            appearance: SubheadAppearance.subtle,
                          )
                        : Container(),
                  ],
                ),
              ),
            ),

            /// closing Icon for bottom sheet
            isDismissible
                ? Padding(
                    padding: py1 + py0_5 + pr3,
                    child: MDSIconButton(
                      icon: Icons.close,
                      type: IconButtonType.transparent,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }

  Widget _dragHandleWidget() {
    return Padding(
      padding: pt4,
      child: Container(
        height: spacing2,
        width: spacing4 + spacing2,
        decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.all(
            Radius.circular(spacing1),
          ),
        ),
      ),
    );
  }
}
