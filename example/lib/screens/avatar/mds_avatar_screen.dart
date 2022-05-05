import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSAvatarScreen extends StatefulWidget {
  static const String routeName = '/mds_avatar_screen';

  @override
  _MDSAvatarScreenState createState() => _MDSAvatarScreenState();
}

class _MDSAvatarScreenState extends State<MDSAvatarScreen> with SpacingMixin, ColorMixin {
  AvatarType _avatarType = AvatarType.jal;
  AvatarScenario _avatarScenario = AvatarScenario.defaultAvatar;
  late List<MDSAvatarType> _avatarTypeList;

  @override
  void initState() {
    super.initState();
    _avatarTypeList = [
      MDSAvatarType(
        avatarText: 'JL',
        avatarType: _avatarType,
      ),
    ];
  }

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
        padding: px4 + pt2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: spacing5,
            ),
            MDSAvatar(
              avatarList: _avatarTypeList,
            ),
            SizedBox(
              height: spacing5,
            ),
            Divider(),
            SizedBox(
              height: spacing5,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: MDSSubhead('Scenarios'),
                    ),
                    Expanded(
                      flex: 7,
                      child: Wrap(
                        children: [
                          _typeOptionWidget(
                            avatarScenario: AvatarScenario.defaultAvatar,
                            groupValue: _avatarScenario,
                          ),
                          _typeOptionWidget(
                            avatarScenario: AvatarScenario.fallbackAvatar,
                            groupValue: _avatarScenario,
                          ),
                          _typeOptionWidget(
                            avatarScenario: AvatarScenario.avatarGroup1,
                            groupValue: _avatarScenario,
                          ),
                          _typeOptionWidget(
                            avatarScenario: AvatarScenario.avatarGroup2,
                            groupValue: _avatarScenario,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: MDSSubhead('Appearance'),
                    ),
                    Expanded(
                      flex: 7,
                      child: Wrap(
                        children: [
                          _appearanceOptionWidget(
                            avatarType: AvatarType.jal,
                            groupValue: _avatarType,
                          ),
                          _appearanceOptionWidget(
                            avatarType: AvatarType.stone,
                            groupValue: _avatarType,
                          ),
                          _appearanceOptionWidget(
                            avatarType: AvatarType.neem,
                            groupValue: _avatarType,
                          ),
                          _appearanceOptionWidget(
                            avatarType: AvatarType.haldi,
                            groupValue: _avatarType,
                          ),
                          _appearanceOptionWidget(
                            avatarType: AvatarType.mirch,
                            groupValue: _avatarType,
                          ),
                          _appearanceOptionWidget(
                            avatarType: AvatarType.tawak,
                            groupValue: _avatarType,
                          ),
                          _appearanceOptionWidget(
                            avatarType: AvatarType.nimbu,
                            groupValue: _avatarType,
                          ),
                          _appearanceOptionWidget(
                            avatarType: AvatarType.neel,
                            groupValue: _avatarType,
                          ),
                          _appearanceOptionWidget(
                            avatarType: AvatarType.jamun,
                            groupValue: _avatarType,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _appearanceOptionWidget({
    required AvatarType avatarType,
    required AvatarType groupValue,
  }) {
    return GestureDetector(
      onTap: () => _updateAppearance(avatarType),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: avatarType,
            groupValue: groupValue,
            onChanged: _updateAppearance,
          ),
          MDSBody(
            avatarType.name.toString(),
          ),
        ],
      ),
    );
  }

  void _updateAppearance(AvatarType? value) {
    setState(() {
      if (_avatarScenario == AvatarScenario.defaultAvatar) {
        _avatarType = value!;
        _avatarTypeList = [
          MDSAvatarType(
            avatarText: 'JL',
            avatarType: _avatarType,
          ),
        ];
      }
    });
  }

  Widget _typeOptionWidget({
    required AvatarScenario avatarScenario,
    required AvatarScenario groupValue,
  }) {
    return GestureDetector(
      onTap: () => _updateType(avatarScenario),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: avatarScenario,
            groupValue: groupValue,
            onChanged: _updateType,
          ),
          MDSBody(
            avatarScenario.name.toString(),
          ),
        ],
      ),
    );
  }

  void _updateType(AvatarScenario? avatarScenario) {
    List<MDSAvatarType> avatarList = [];
    if (avatarScenario == AvatarScenario.fallbackAvatar) {
      avatarList = [
        MDSAvatarType(
          avatarText: '',
          avatarType: AvatarType.jal,
        ),
      ];
    } else if (avatarScenario == AvatarScenario.avatarGroup1) {
      avatarList = [
        MDSAvatarType(
          avatarText: 'JL',
          avatarType: AvatarType.jal,
        ),
        MDSAvatarType(
          avatarText: 'SH',
          avatarType: AvatarType.neem,
        ),
      ];
    } else if (avatarScenario == AvatarScenario.avatarGroup2) {
      avatarList = [
        MDSAvatarType(
          avatarText: 'JL',
          avatarType: AvatarType.jal,
        ),
        MDSAvatarType(
          avatarText: 'SH',
          avatarType: AvatarType.neem,
        ),
        MDSAvatarType(
          avatarText: 'AS',
          avatarType: AvatarType.neel,
        ),
      ];
    } else {
      avatarList = [
        MDSAvatarType(
          avatarText: 'JL',
          avatarType: _avatarType,
        ),
      ];
    }
    setState(() {
      _avatarScenario = avatarScenario!;
      _avatarTypeList = avatarList;
    });
  }
}

enum AvatarScenario {
  defaultAvatar,
  fallbackAvatar,
  avatarGroup1,
  avatarGroup2,
}
