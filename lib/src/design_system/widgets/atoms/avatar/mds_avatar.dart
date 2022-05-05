import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSAvatar extends StatelessWidget with SpacingMixin, ColorMixin, FontMixin {
  final List<MDSAvatarType>? avatarList;

  MDSAvatar({
    required this.avatarList,
  });

  @override
  Widget build(BuildContext context) {
    /// if one single item of avatar is there
    if (avatarList!.length == 1) {
      return _avatarItem(avatarList!.single, context, false);
    }

    /// AVATAR GROUP ///

    /// if two items of avatar are there
    else if (avatarList!.length == 2) {
      return Container(
        width: spacing10 + spacing10 + spacing2 + spacing1_5,
        color: ColorToken.white,
        child: Stack(
          children: [
            _avatarItem(avatarList![0], context, false),
            Positioned(
              left: spacing10,
              bottom: -spacing1,
              child: _avatarItem(avatarList![1], context, true),
            ),
          ],
        ),
      );
    }

    /// if more than two items of avatar are there
    else if (avatarList!.length > 2) {
      return Container(
        width: spacing10 + spacing10 + spacing10 + spacing2 + spacing1_5,
        color: ColorToken.white,
        child: Stack(
          children: [
            _avatarItem(avatarList![0], context, false),
            Positioned(
              left: spacing10,
              bottom: -spacing1,
              child: _avatarItem(avatarList![1], context, true),
            ),
            Positioned(
              left: spacing10 + spacing10,
              bottom: -spacing1,
              child: _avatarItem(
                  MDSAvatarType(avatarText: '+' + (avatarList!.length - 2).toString(), avatarType: AvatarType.stone),
                  context,
                  true),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  /// single item of avatar
  Widget _avatarItem(MDSAvatarType? mdsAvatarType, BuildContext context, bool haveBorder) {
    return Container(
      decoration: BoxDecoration(
        color: mdsAvatarType?.avatarText != null && mdsAvatarType!.avatarText!.trim().isNotEmpty
            ? _getAvatarTheme(mdsAvatarType.avatarType).keys.first
            : secondary,
        shape: BoxShape.circle,
        border: Border.all(
          width: spacing1,
          color: haveBorder ? ColorToken.white : ColorToken.transparent,
        ),
      ),
      child: Padding(
        padding: p2 + p0_5 + (haveBorder ? p1 : p0),
        child: mdsAvatarType?.avatarText != null && mdsAvatarType!.avatarText!.trim().isNotEmpty
            ? MDSBody(
                mdsAvatarType.avatarText!.trim(),
                color: _getAvatarTheme(mdsAvatarType.avatarType).values.first,
              ).copyWith(
                context,
                fontSize: fontSize17,
                fontWeight: FontWeight.w600,
              )
            : Icon(
                Icons.person_outline,
                size: spacing6,
              ),
      ),
    );
  }

  /// getting text color and background color of avatar based on
  /// the type of avatar
  Map<Color, Color> _getAvatarTheme(AvatarType? avatarType) {
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

class MDSAvatarType {
  final String? avatarText;
  final AvatarType avatarType;

  MDSAvatarType({
    this.avatarText = '',
    this.avatarType = AvatarType.neel,
  });
}

/// themes of avatar available
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
