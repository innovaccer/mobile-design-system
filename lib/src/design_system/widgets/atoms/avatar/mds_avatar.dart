import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSAvatar extends StatelessWidget with SpacingMixin, ColorMixin {
  final List<MdsAvatarType>? avatarList;

  MDSAvatar({
    this.avatarList,
  });

  @override
  Widget build(BuildContext context) {
    if (avatarList!.length == 1) {
      return _avatarItem(avatarList!.single, context);
    } else if (avatarList!.length == 2) {
      return Stack(
        children: [
          _avatarItem(avatarList![0], context),
          Positioned(
            right: 0,
            left: 0,
            child: Padding(
              padding: pl4,
              child: _avatarItem(avatarList![1], context),
            ),
          ),
        ],
      );
    } else if (avatarList!.length > 2) {
      return Row(
        children: [
          _avatarItem(avatarList![0], context),
          _avatarItem(avatarList![1], context),
          _avatarItem(
              MdsAvatarType(
                avatarText: '+2',
                avatarType: AvatarType.stone,
              ),
              context),
        ],
      );
    }
    return Container();
  }

  Widget _avatarItem(MdsAvatarType? mdsAvatarType, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mdsAvatarType?.avatarText != null && mdsAvatarType!.avatarText!.trim().isNotEmpty
            ? _getAvatarTheme(mdsAvatarType.avatarType).keys.first
            : secondary,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: p4 + p2,
        child: mdsAvatarType?.avatarText != null && mdsAvatarType!.avatarText!.trim().isNotEmpty
            ? MDSBody(
                mdsAvatarType.avatarText!.trim(),
                color: _getAvatarTheme(mdsAvatarType.avatarType).values.first,
              ).copyWith(
                context,
                fontSize: spacing2 + spacingXS,
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
