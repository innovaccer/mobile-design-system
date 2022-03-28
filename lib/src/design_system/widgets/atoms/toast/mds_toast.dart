import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';
import 'package:innovaccer_design_system/src/design_system/widgets/atoms/card/mds_card_old.dart';

enum ToastAppearanceType {
  /// cannot call it default as it is keyword
  defaultType,
  info,
  success,
  alert,
  warning,
}

void displayToast({
  required String message,
  ToastAppearanceType? appearanceType,
  String? actionButtonTitle1,
  Function? actionButtonCallback1,
  String? actionButtonTitle2,
  Function? actionButtonCallback2,
}) {
  showToastWidget(
    ToastWidget(
      message: message,
      appearanceType: appearanceType,
      actionButtonTitle1: actionButtonTitle1,
      actionButtonCallback1: actionButtonCallback1,
      actionButtonTitle2: actionButtonTitle2,
      actionButtonCallback2: actionButtonCallback2,
    ),
  );
}

class MDSToast extends StatelessWidget {
  final Widget child;
  final Locale locale;
  final int toastDurationInSecs;

  MDSToast({
    /// wrap your app with [MDSToast] by passing [MaterialApp] as child here
    required this.child,
    this.locale = const Locale('en', 'US'),
    this.toastDurationInSecs = 3,
  });

  @override
  Widget build(BuildContext context) {
    return StyledToast(
      child: child,

      locale: locale,

      /// The position of toast
      toastPositions: StyledToastPosition.bottom,

      /// The animation type of toast
      toastAnimation: StyledToastAnimation.fade,

      /// The reverse animation of toast (during toast dismiss)
      reverseAnimation: StyledToastAnimation.slideToBottomFade,

      /// The duration of toast showing, when set [duration] to Duration.zero, toast won't dismiss automatically.
      duration: Duration(seconds: toastDurationInSecs),

      /// Dismiss any other toast before showing the current toast
      dismissOtherOnShow: true,

      /// Is keyboard hidden when toast is shown
      isHideKeyboard: false,

      /// ignoring actions on toast
      isIgnoring: false,

      /// does the toast take full width of the screen
      fullWidth: false,
    );
  }
}

class ToastWidget extends StatelessWidget with ColorMixin, SpacingMixin, FontMixin {
  final String message;
  final ToastAppearanceType? appearanceType;
  final String? actionButtonTitle1;
  final Function? actionButtonCallback1;
  final String? actionButtonTitle2;
  final Function? actionButtonCallback2;
  final bool showDismissAnimation = true;

  ToastWidget({
    required this.message,
    this.appearanceType,
    this.actionButtonTitle1,
    this.actionButtonCallback1,
    this.actionButtonTitle2,
    this.actionButtonCallback2,
  });

  @override
  Widget build(BuildContext context) {
    double? _textScaleFactor = 1.0;
    // ignore: unnecessary_null_comparison
    if (TextScaler.of<TextScalingFactor>(context) != null) {
      _textScaleFactor = TextScaler.of<TextScalingFactor>(context)?.scaleFactor;
    }
    return Padding(
      padding: px6,
      child: MDSCardOld(
        shadowType: CardShadowType.dark,
        child: Container(
          color: _getToastColor(),
          padding: px6 + py5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (appearanceType != ToastAppearanceType.defaultType) ...[
                      Padding(
                        padding: pt1,
                        child: Icon(
                          _getLeadingIcon(),
                          size: spacing2,
                          color: _getContentColor(),
                        ),
                      ),
                      SizedBox(
                        width: spacingL,
                      ),
                    ],
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              message,
                              style: TextStyle(
                                fontSize: fontSize16,
                                fontWeight: FontWeight.w500,
                                color: _getContentColor(),
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: _textScaleFactor,
                            ),
                          ),
                          if ((actionButtonTitle1 != null && actionButtonCallback1 != null) ||
                              (actionButtonTitle2 != null && actionButtonCallback2 != null)) ...[
                            SizedBox(
                              height: spacingL,
                            ),
                            Flexible(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (actionButtonTitle1 != null && actionButtonCallback1 != null) ...[
                                    _actionButtonWidget(
                                      context,
                                      buttonTitle: actionButtonTitle1,
                                      callback: actionButtonCallback1,
                                    ),
                                    SizedBox(
                                      width: spacing,
                                    ),
                                  ],
                                  if (actionButtonTitle2 != null && actionButtonCallback2 != null) ...[
                                    _actionButtonWidget(
                                      context,
                                      buttonTitle: actionButtonTitle2,
                                      callback: actionButtonCallback2,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: spacingL,
              ),
              Padding(
                padding: pt1,
                child: GestureDetector(
                  onTap: () => dismissToast(),
                  child: Icon(
                    Icons.close,
                    size: spacing2,
                    color: _getContentColor(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dismissToast() {
    ToastManager().dismissAll(showAnim: showDismissAnimation);
  }

  Widget _actionButtonWidget(
    context, {
    String? buttonTitle,
    Function? callback,
  }) {
    double? _textScaleFactor = 1.0;
    // ignore: unnecessary_null_comparison
    if (TextScaler.of<TextScalingFactor>(context) != null) {
      _textScaleFactor = TextScaler.of<TextScalingFactor>(context)?.scaleFactor;
    }
    return Flexible(
      child: Material(
        color: _getActionButtonColor(),
        child: InkWell(
          onTap: () => callback!(),
          child: Ink(
            padding: py3 + px4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(spacingM),
            ),
            // todo: use MDSText
            child: Text(
              buttonTitle!,
              style: TextStyle(
                fontSize: fontSize14,
                fontWeight: FontWeight.w400,
                color: textWhiteColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: _textScaleFactor,
            ),
          ),
        ),
      ),
    );
  }

  Color _getToastColor() {
    switch (appearanceType) {
      case ToastAppearanceType.defaultType:
        return inverse;
      case ToastAppearanceType.info:
        return primary;
      case ToastAppearanceType.success:
        return success;
      case ToastAppearanceType.alert:
        return alert;
      case ToastAppearanceType.warning:
        return warning;
      default:
        return inverse;
    }
  }

  IconData _getLeadingIcon() {
    switch (appearanceType) {
      case ToastAppearanceType.info:
      case ToastAppearanceType.alert:
      case ToastAppearanceType.warning:
        return Icons.info;
      case ToastAppearanceType.success:
        return Icons.check_circle;
      default:
        return Icons.info;
    }
  }

  Color _getContentColor() {
    switch (appearanceType) {
      case ToastAppearanceType.defaultType:
      case ToastAppearanceType.info:
      case ToastAppearanceType.success:
      case ToastAppearanceType.alert:
        return textWhiteColor;
      case ToastAppearanceType.warning:
        return warningDarker;
      default:
        return textWhiteColor;
    }
  }

  Color _getActionButtonColor() {
    switch (appearanceType) {
      case ToastAppearanceType.defaultType:
        return inverseLighter;
      case ToastAppearanceType.info:
        return primaryDark;
      case ToastAppearanceType.success:
        return successDark;
      case ToastAppearanceType.alert:
        return alertDark;
      case ToastAppearanceType.warning:
        return warningDark;
      default:
        return inverseLighter;
    }
  }
}
