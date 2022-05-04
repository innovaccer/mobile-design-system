import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSAvatar extends StatelessWidget with SpacingMixin, ColorMixin, FontMixin {
  final List<MdsAvatarType>? avatarList;

  MDSAvatar({
    this.avatarList,
  });

  @override
  Widget build(BuildContext context) {
    if (avatarList!.length == 1) {
      return _avatarItem(avatarList!.single, context, false);
    } else if (avatarList!.length == 2) {
      return Container(
        width: 40 + 40 + 8 + 8,
        color: ColorToken.white,
        child: Stack(
          children: [
            _avatarItem(avatarList![0], context, false),
            Positioned(
              left: 40,
              bottom: -4,
              child: _avatarItem(avatarList![1], context, true),
            ),
          ],
        ),
      );
    } else if (avatarList!.length > 2) {
      return Container(
        width: 40 + 40 + 40 + 8 + 8,
        color: ColorToken.white,
        child: Stack(
          children: [
            _avatarItem(avatarList![0], context, false),
            Positioned(
              left: 40,
              bottom: -4,
              child: _avatarItem(avatarList![1], context, true),
            ),
            Positioned(
              left: 80,
              bottom: -4,
              child: _avatarItem(MdsAvatarType(avatarText: '+2', avatarType: AvatarType.stone), context, true),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget _avatarItem(MdsAvatarType? mdsAvatarType, BuildContext context, bool haveBorder) {
    return Container(
      decoration: BoxDecoration(
        color: mdsAvatarType?.avatarText != null && mdsAvatarType!.avatarText!.trim().isNotEmpty
            ? _getAvatarTheme(mdsAvatarType.avatarType).keys.first
            : secondary,
        shape: BoxShape.circle,
        border: Border.all(
          width: spacingM,
          color: haveBorder ? ColorToken.white : ColorToken.transparent,
        ),
      ),
      child: Padding(
        padding: p4 + p2 + (haveBorder ? p3 : p0),
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
                size: spacingXL,
              ),
      ),
    );
  }

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

class MdsAvatarType {
  final String? avatarText;
  final AvatarType avatarType;

  MdsAvatarType({
    this.avatarText = '',
    this.avatarType = AvatarType.neel,
  });
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
