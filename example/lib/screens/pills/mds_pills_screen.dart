import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSPillsScreen extends StatefulWidget {
  static const String routeName = '/mds_pills_screen';

  @override
  State<MDSPillsScreen> createState() => _MDSPillsScreenState();
}

class _MDSPillsScreenState extends State<MDSPillsScreen> with SpacingMixin, ColorMixin {
  final String _defaultCount = '9';
  PillType _pillType = PillType.solid;
  PillAppearance _pillAppearance = PillAppearance.jal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSHeadline(
          'Pills',
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
            MDSPill(pillCount: _defaultCount, pillType: _pillType, pillAppearance: _pillAppearance),
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
                              value: PillType.solid,
                              groupValue: _pillType,
                              displayText: 'solid',
                            ),
                            _typeOptionWidget(
                              value: PillType.subtle,
                              groupValue: _pillType,
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
                              value: PillAppearance.jal,
                              groupValue: _pillAppearance,
                              displayText: 'jal',
                            ),
                            _appearanceOptionWidget(
                              value: PillAppearance.stone,
                              groupValue: _pillAppearance,
                              displayText: 'stone',
                            ),
                            _appearanceOptionWidget(
                              value: PillAppearance.neem,
                              groupValue: _pillAppearance,
                              displayText: 'neem',
                            ),
                            _appearanceOptionWidget(
                              value: PillAppearance.haldi,
                              groupValue: _pillAppearance,
                              displayText: 'haldi',
                            ),
                            _appearanceOptionWidget(
                              value: PillAppearance.mirch,
                              groupValue: _pillAppearance,
                              displayText: 'mirch',
                            ),
                            _appearanceOptionWidget(
                              value: PillAppearance.tawak,
                              groupValue: _pillAppearance,
                              displayText: 'tawak',
                            ),
                            _appearanceOptionWidget(
                              value: PillAppearance.nimbu,
                              groupValue: _pillAppearance,
                              displayText: 'nimbu',
                            ),
                            _appearanceOptionWidget(
                              value: PillAppearance.neel,
                              groupValue: _pillAppearance,
                              displayText: 'neel',
                            ),
                            _appearanceOptionWidget(
                              value: PillAppearance.jamun,
                              groupValue: _pillAppearance,
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
    required PillType value,
    required PillType groupValue,
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

  void _updateType(PillType? value) {
    setState(() {
      _pillType = value!;
    });
  }

  Widget _appearanceOptionWidget({
    required PillAppearance value,
    required PillAppearance groupValue,
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

  void _updateAppearance(PillAppearance? value) {
    setState(() {
      _pillAppearance = value!;
    });
  }
}
