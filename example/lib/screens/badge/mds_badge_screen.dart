import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSBadgeScreen extends StatefulWidget {
  static const String routeName = '/mds_badge_screen';

  @override
  State<MDSBadgeScreen> createState() => _MDSBadgeScreenState();
}

class _MDSBadgeScreenState extends State<MDSBadgeScreen> with SpacingMixin, ColorMixin {
  final String _defaultText = 'BADGE';
  BadgeType _badgeType = BadgeType.solid;
  BadgeAppearance _badgeAppearance = BadgeAppearance.jal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSHeadline(
          'Badges',
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
            MDSBadge(badgeText: _defaultText, badgeType: _badgeType, badgeAppearance: _badgeAppearance),
            SizedBox(
              height: spacing5,
            ),
            Divider(),
            Expanded(
              child: ListView(
                padding: p0,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: MDSSubhead('Type'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Wrap(
                          children: [
                            _typeOptionWidget(
                              value: BadgeType.solid,
                              groupValue: _badgeType,
                              displayText: 'solid',
                            ),
                            _typeOptionWidget(
                              value: BadgeType.subtle,
                              groupValue: _badgeType,
                              displayText: 'subtle',
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
                              value: BadgeAppearance.jal,
                              groupValue: _badgeAppearance,
                              displayText: 'jal',
                            ),
                            _appearanceOptionWidget(
                              value: BadgeAppearance.stone,
                              groupValue: _badgeAppearance,
                              displayText: 'stone',
                            ),
                            _appearanceOptionWidget(
                              value: BadgeAppearance.neem,
                              groupValue: _badgeAppearance,
                              displayText: 'neem',
                            ),
                            _appearanceOptionWidget(
                              value: BadgeAppearance.haldi,
                              groupValue: _badgeAppearance,
                              displayText: 'haldi',
                            ),
                            _appearanceOptionWidget(
                              value: BadgeAppearance.mirch,
                              groupValue: _badgeAppearance,
                              displayText: 'mirch',
                            ),
                            _appearanceOptionWidget(
                              value: BadgeAppearance.tawak,
                              groupValue: _badgeAppearance,
                              displayText: 'tawak',
                            ),
                            _appearanceOptionWidget(
                              value: BadgeAppearance.nimbu,
                              groupValue: _badgeAppearance,
                              displayText: 'nimbu',
                            ),
                            _appearanceOptionWidget(
                              value: BadgeAppearance.neel,
                              groupValue: _badgeAppearance,
                              displayText: 'neel',
                            ),
                            _appearanceOptionWidget(
                              value: BadgeAppearance.jamun,
                              groupValue: _badgeAppearance,
                              displayText: 'jamun',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _typeOptionWidget({
    required BadgeType value,
    required BadgeType groupValue,
    required String displayText,
  }) {
    return GestureDetector(
      onTap: () => _updateType(value),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: value,
            groupValue: groupValue,
            onChanged: _updateType,
          ),
          MDSBody(
            displayText,
          ),
        ],
      ),
    );
  }

  void _updateType(BadgeType? value) {
    setState(() {
      _badgeType = value!;
    });
  }

  Widget _appearanceOptionWidget({
    required BadgeAppearance value,
    required BadgeAppearance groupValue,
    required String displayText,
  }) {
    return GestureDetector(
      onTap: () => _updateAppearance(value),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: value,
            groupValue: groupValue,
            onChanged: _updateAppearance,
          ),
          MDSBody(
            displayText,
          ),
        ],
      ),
    );
  }

  void _updateAppearance(BadgeAppearance? value) {
    setState(() {
      _badgeAppearance = value!;
    });
  }
}
