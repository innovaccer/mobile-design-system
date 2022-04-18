import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSAvatar extends StatelessWidget with SpacingMixin, ColorMixin {
  final String avatarText;
  final AvatarType avatarType;

  MDSAvatar({
    required this.avatarText,
    this.avatarType = AvatarType.neel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getAvatarTheme(avatarType).keys.first,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: p4 + p2,
        child: MDSBody(
          avatarText,
          color: _getAvatarTheme(avatarType).values.first,
        ).copyWith(
          context,
          fontSize: spacing2 + spacingXS,
        ),
      ),
    );
  }

  Map<Color, Color> _getAvatarTheme(AvatarType avatarType) {
    Color avatarBackgroundColor = primary;
    Color avatarTextColor = ColorToken.white;
    if (avatarType == AvatarType.haldi) {
      avatarBackgroundColor = warning;
      avatarTextColor = warningDarker;
    } else if (avatarType == AvatarType.stone) {
      avatarBackgroundColor = secondary;
      avatarTextColor = ColorToken.black;
    } else if (avatarType == AvatarType.jamun) {
      avatarBackgroundColor = accent2;
    } else if (avatarType == AvatarType.tawak) {
      avatarBackgroundColor = accent1;
      avatarTextColor = accent1Darker;
    } else if (avatarType == AvatarType.nimbu) {
      avatarBackgroundColor = accent4;
      avatarTextColor = accent4Darker;
    } else if (avatarType == AvatarType.neem) {
      avatarBackgroundColor = success;
      avatarTextColor = successDarker;
    } else if (avatarType == AvatarType.mirch) {
      avatarBackgroundColor = alert;
    } else if (avatarType == AvatarType.jal) {
      avatarBackgroundColor = primary;
    }
    Map<Color, Color> _avatarTheme = {avatarBackgroundColor: avatarTextColor};
    return _avatarTheme;
  }
}

enum AvatarType {
  neel,
  haldi,
  stone,
  jamun,
  tawak,
  nimbu,
  neem,
  mirch,
  jal,
}
