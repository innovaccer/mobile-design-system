import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';
import 'package:innovaccer_design_system/src/design_system/widgets/miscellaneous/custom_bottom_sheet.dart'
    as custom_bottom_sheet;
import 'package:innovaccer_design_system/src/design_system/widgets/miscellaneous/custom_splash_factory.dart';

class MDSActionSheet with SpacingMixin, ColorMixin {
  Future<void> open({
    required BuildContext context,
    required List<MDSActionSheetElement> listOfOptions,
    required String heading,
  }) async {
    assert(listOfOptions.isNotEmpty);
    assert(heading.isNotEmpty);

    double maxActionSheetHeight = MediaQuery.of(context).size.height * 0.93 -
        MediaQuery.of(context).padding.bottom;
    double actionSheetHeight = maxActionSheetHeight;
    double headerHeight = 56;

    await custom_bottom_sheet.showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isScrollControlled: true,
      builder: (BuildContext actionSheetContext) {
        return StatefulBuilder(
          builder: (
            BuildContext actionSheetContext,
            StateSetter actionSheetSetState,
          ) {
            return Container(
              decoration: _actionSheetDecoration,
              child: SafeArea(
                top: false,
                left: false,
                right: false,
                bottom: true,
                child: Container(
                  height:
                      headerHeight + actionSheetHeight > maxActionSheetHeight
                          ? maxActionSheetHeight
                          : headerHeight + actionSheetHeight,
                  decoration: _actionSheetDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MeasureSize(
                        onChange: (size) {
                          actionSheetSetState(() {
                            headerHeight = size!.height;
                          });
                        },
                        child: _actionSheetHeader(
                          actionSheetContext,
                          heading,
                        ),
                      ),
                      Flexible(
                        child: MeasureSize(
                          onChange: (size) {
                            actionSheetSetState(() {
                              actionSheetHeight = size!.height;
                            });
                          },
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: p0,
                            shrinkWrap: true,
                            itemCount: listOfOptions.length,
                            itemBuilder: (context, index) {
                              return _actionSheetElement(
                                primaryText: listOfOptions[index].primaryText!,
                                onTap: listOfOptions[index].onTap!,
                                secondaryText:
                                    listOfOptions[index].secondaryText,
                                prefixIcon: listOfOptions[index].prefixIcon,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  BoxDecoration get _actionSheetDecoration => BoxDecoration(
        color: ColorToken.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(spacingL),
          topRight: Radius.circular(spacingL),
        ),
      );

  Widget _actionSheetHeader(
    BuildContext context,
    String heading,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: Padding(
            padding: pl6 + py6 + pr2,
            child: MDSBody(
              heading,
              appearance: BodyAppearance.subtle,
            ),
          ),
        ),
        Padding(
          padding: py3 + py2 + pr3,
          child: MDSIconButton(
            icon: Icons.close,
            type: IconButtonType.transparent,
            onTap: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }

  Widget _actionSheetElement({
    required String primaryText,
    String? secondaryText,
    IconData? prefixIcon,
    required Function() onTap,
  }) {
    return Ink(
      child: Material(
        color: ColorToken.transparent,
        shadowColor: ColorToken.transparent,
        animationDuration: Duration(seconds: 0),
        child: InkWell(
          onTap: onTap,
          hoverColor: secondaryLighter,
          splashColor: secondaryLighter,
          overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> materialStates) {
            return secondaryLighter;
          }),
          highlightColor: secondaryLighter,
          splashFactory: CustomSplash.splashFactory,
          child: Padding(
            padding: p6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (prefixIcon != null) ...[
                  Icon(
                    prefixIcon,
                    color: inverseLighter,
                    size: spacingXL,
                  ),
                  SizedBox(
                    width: spacing2,
                  ),
                ],
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: MDSBody(
                          primaryText,
                          appearance: BodyAppearance.defaultType,
                        ),
                      ),
                      if (secondaryText != null &&
                          secondaryText.isNotEmpty) ...[
                        SizedBox(
                          height: spacingS,
                        ),
                        Flexible(
                          child: MDSSubhead(
                            secondaryText,
                            appearance: SubheadAppearance.subtle,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MDSActionSheetElement {
  final String? primaryText;
  final String? secondaryText;
  final IconData? prefixIcon;
  final Function()? onTap;

  MDSActionSheetElement({
    this.primaryText,
    this.secondaryText,
    this.prefixIcon,
    this.onTap,
  });
}
