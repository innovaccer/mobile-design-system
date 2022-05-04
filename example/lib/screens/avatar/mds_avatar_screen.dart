import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSAvatarScreen extends StatefulWidget {
  static const String routeName = '/mds_avatar_screen';

  @override
  _MDSAvatarScreenState createState() => _MDSAvatarScreenState();
}

class _MDSAvatarScreenState extends State<MDSAvatarScreen> with SpacingMixin, ColorMixin {
  List<AvatarType> _avatarList = [
    AvatarType.neel,
    AvatarType.haldi,
    AvatarType.stone,
    AvatarType.jamun,
    AvatarType.tawak,
    AvatarType.nimbu,
    AvatarType.neem,
    AvatarType.mirch,
    AvatarType.jal,
  ];
  String avatarText = 'JD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorToken.white,
      appBar: AppBar(
        title: MDSTitle(
          'Avatar',
          type: TitleType.title3,
        ),
      ),
      body: Padding(
        padding: p6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MDSAvatar(
                  avatarList: [
                    MdsAvatarType(
                      avatarText: avatarText,
                      avatarType: _avatarList[0],
                    ),
                  ],
                ),
                MDSAvatar(
                  avatarList: [
                    MdsAvatarType(
                      avatarText: avatarText,
                      avatarType: _avatarList[1],
                    ),
                  ],
                ),
                MDSAvatar(
                  avatarList: [
                    MdsAvatarType(
                      avatarText: avatarText,
                      avatarType: _avatarList[2],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: spacing3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MDSAvatar(
                  avatarList: [
                    MdsAvatarType(
                      avatarText: avatarText,
                      avatarType: _avatarList[3],
                    ),
                  ],
                ),
                MDSAvatar(
                  avatarList: [
                    MdsAvatarType(
                      avatarText: avatarText,
                      avatarType: _avatarList[4],
                    ),
                  ],
                ),
                MDSAvatar(avatarList: [
                  MdsAvatarType(
                    avatarText: avatarText,
                    avatarType: _avatarList[5],
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: spacing3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MDSAvatar(
                  avatarList: [
                    MdsAvatarType(
                      avatarText: avatarText,
                      avatarType: _avatarList[6],
                    ),
                  ],
                ),
                MDSAvatar(
                  avatarList: [
                    MdsAvatarType(
                      avatarText: avatarText,
                      avatarType: _avatarList[7],
                    ),
                  ],
                ),
                MDSAvatar(
                  avatarList: [
                    MdsAvatarType(
                      avatarText: avatarText,
                      avatarType: _avatarList[8],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: spacing3,
            ),
            MDSAvatar(
              avatarList: [
                MdsAvatarType(
                  avatarText: avatarText,
                  avatarType: _avatarList[4],
                ),
                MdsAvatarType(
                  avatarText: avatarText,
                  avatarType: _avatarList[6],
                ),
              ],
            ),
            SizedBox(
              height: spacing3,
            ),
            MDSAvatar(
              avatarList: [
                MdsAvatarType(
                  avatarText: avatarText,
                  avatarType: _avatarList[4],
                ),
                MdsAvatarType(
                  avatarText: avatarText,
                  avatarType: _avatarList[6],
                ),
                MdsAvatarType(
                  avatarText: avatarText,
                  avatarType: _avatarList[8],
                ),
              ],
            ),
            SizedBox(
              height: spacing3,
            ),
          ],
        ),
      ),
    );
  }
}
