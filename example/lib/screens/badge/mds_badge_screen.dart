import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSBadgeScreen extends StatefulWidget {
  static const String routeName = '/mds_badge_screen';

  @override
  State<MDSBadgeScreen> createState() => _MDSBadgeScreenState();
}

class _MDSBadgeScreenState extends State<MDSBadgeScreen> with SpacingMixin, ColorMixin {
  String defaultText = 'BADGE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSHeadline(
          'Badges',
        ),
      ),
      body: Padding(
        padding: p6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MDSBody(
              'Solid',
            ),
            SizedBox(
              height: spacing,
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 16,
              runSpacing: 16,
              children: [
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.solid, badgeAppearance: BadgeAppearance.jal),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.solid, badgeAppearance: BadgeAppearance.stone),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.solid, badgeAppearance: BadgeAppearance.neem),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.solid, badgeAppearance: BadgeAppearance.haldi),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.solid, badgeAppearance: BadgeAppearance.mirch),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.solid, badgeAppearance: BadgeAppearance.tawak),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.solid, badgeAppearance: BadgeAppearance.nimbu),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.solid, badgeAppearance: BadgeAppearance.neel),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.solid, badgeAppearance: BadgeAppearance.jamun),
              ],
            ),
            SizedBox(
              height: spacing5,
            ),
            MDSBody(
              'Subtle',
            ),
            SizedBox(
              height: spacing,
            ),
            Wrap(
              direction: Axis.horizontal,
              spacing: 16,
              runSpacing: 16,
              children: [
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.subtle, badgeAppearance: BadgeAppearance.jal),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.subtle, badgeAppearance: BadgeAppearance.stone),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.subtle, badgeAppearance: BadgeAppearance.neem),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.subtle, badgeAppearance: BadgeAppearance.haldi),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.subtle, badgeAppearance: BadgeAppearance.mirch),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.subtle, badgeAppearance: BadgeAppearance.tawak),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.subtle, badgeAppearance: BadgeAppearance.nimbu),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.subtle, badgeAppearance: BadgeAppearance.neel),
                MDSBadge(badgeText: defaultText, badgeType: BadgeType.subtle, badgeAppearance: BadgeAppearance.jamun),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
