import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class NavigationBarBackButton extends StatelessWidget {
  /// [isCrossIcon] to get cross icon if set to true
  final bool isCrossIcon;

  /// [onTap] Function to get the Navigation bar back button
  final Function? onTap;

  ///[navigationIconColor] handles the color of back icon
  final Color? navigationIconColor;

  NavigationBarBackButton({
    this.onTap,
    this.navigationIconColor,
    this.isCrossIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return MDSCommon.getPlatform() == PlatformType.iOS
        ? _getIOSBackButton(context, isCrossIcon, onTap, navigationIconColor)
        : _getAndroidButton(context, isCrossIcon, onTap, navigationIconColor);
  }

  Widget _getIOSBackButton(
    BuildContext context,
    bool isCrossIcon,
    Function? onTap,
    Color? navigationIconColor,
  ) {
    return CupertinoButton(
      child: Icon(
        isCrossIcon ? Icons.close : CupertinoIcons.chevron_back,
        color: navigationIconColor ?? Colors.black,
      ),
      onPressed: () {
        if (onTap != null) {
          onTap();
        } else {
          Navigator.pop(context);
        }
      },
    );
  }

  Widget _getAndroidButton(
    BuildContext context,
    bool isCrossIcon,
    Function? onTap,
    Color? navigationIconColor,
  ) {
    return IconButton(
      icon: Icon(
        isCrossIcon ? Icons.close : Icons.arrow_back,
        color: navigationIconColor ?? Colors.black,
      ),
      onPressed: () {
        if (onTap != null) {
          onTap();
        } else {
          Navigator.pop(context);
        }
      },
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    );
  }
}
