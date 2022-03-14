import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSListScreen extends StatefulWidget {
  static const String routeName = '/mds_list_screen';

  @override
  _MDSListScreenState createState() => _MDSListScreenState();
}

class _MDSListScreenState extends State<MDSListScreen> with SpacingMixin, ColorMixin {
  List<String> primaryList = [];
  List<String> secondaryList = [];
  List<String> tertiaryList = [];
  List<Widget> prefixWidgetList = [];
  List<Widget> suffixWidgetList = [];
  int i = 0;
  late List<Color> randomColors;
  late bool _prefixWidgetView;
  late bool _suffixWidgetView;
  late String _listType;
  late bool _header;
  late bool _headerAction;

  @override
  void initState() {
    super.initState();
    _listType = 'Primary';
    randomColors = [
      ColorToken.jal,
      ColorToken.jamun,
      ColorToken.neem,
      ColorToken.haldi,
      ColorToken.tawak,
    ];
    _prefixWidgetView = false;
    _suffixWidgetView = false;
    _header = false;
    _headerAction = false;

    /// adding dummy data
    while (i++ < 20) {
      primaryList.add('Primary Item ${i}');
      secondaryList.add('Secondary Item ${i}');
      tertiaryList.add('Tertiary Item ${i}');
      prefixWidgetList.add(
        Padding(
          padding: pt2,
          child: Container(
            height: spacing4 - spacingL,
            width: spacing4 - spacingL,
            child: Center(child: MDSBody('I$i', color: ColorToken.white)),
            decoration: BoxDecoration(
              color: randomColors[i % (randomColors.length)],
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
      suffixWidgetList.add(
        Padding(
          padding: pt3,
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSTitle(
          'MDSList',
          type: TitleType.title3,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: MDSList(
              length: primaryList.length,
              sectionHeading: _header ? 'Heading' : '',
              sectionHeadingOnClick: () {
                displayToast(
                  message: 'Heading is tapped!',
                  appearanceType: ToastAppearanceType.success,
                );
              },
              sectionHeadingAction: _headerAction ? 'HeadingWithAction' : '',
              sectionHeadingActionOnClick: () {
                displayToast(
                  message: 'HeadingWithAction is tapped!',
                  appearanceType: ToastAppearanceType.success,
                );
              },
              itemBuilder: (listContext, index) {
                return GestureDetector(
                  onTap: () {
                    displayToast(
                      message: 'Item ${index + 1} tapped!',
                      appearanceType: ToastAppearanceType.success,
                    );
                  },
                  child: MDSListItem(
                    showDivider: index != primaryList.length - 1,
                    primaryText: primaryList[index],

                    /// show secondaryText in both cases of Secondary and Tertiary
                    secondaryText: _listType == 'Secondary' || _listType == 'Tertiary' ? secondaryList[index] : null,
                    tertiaryText: _listType == 'Tertiary' ? tertiaryList[index] : null,
                    prefixWidget: _prefixWidgetView ? prefixWidgetList[index] : null,
                    suffixWidget: _suffixWidgetView ? suffixWidgetList[index] : null,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: p6 + pb4,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                            'Primary',
                          ),
                          _typeOptionWidget(
                            'Secondary',
                          ),
                          _typeOptionWidget(
                            'Tertiary',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: MDSSubhead('Icon'),
                    ),
                    Expanded(
                      flex: 7,
                      child: _listIcons(),
                    ),
                  ],
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: MDSSubhead('HeaderType'),
                    ),
                    Expanded(
                      flex: 7,
                      child: _headers(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _typeOptionWidget(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _listType = text;
        });
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: text,
            groupValue: _listType,
            onChanged: (String? val) {
              setState(() {
                _listType = val!;
              });
            },
          ),
          MDSSubhead(
            text,
          ),
        ],
      ),
    );
  }

  Widget _listIcons() {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _prefixWidgetView = !_prefixWidgetView;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio(
                visualDensity: VisualDensity.compact,
                value: true,
                groupValue: _prefixWidgetView,
                onChanged: (val) {
                  setState(() {
                    _prefixWidgetView = !_prefixWidgetView;
                  });
                },
              ),
              MDSSubhead(
                'PrefixIcon',
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _suffixWidgetView = !_suffixWidgetView;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio(
                visualDensity: VisualDensity.compact,
                value: true,
                groupValue: _suffixWidgetView,
                onChanged: (val) {
                  setState(() {
                    _suffixWidgetView = !_suffixWidgetView;
                  });
                },
              ),
              MDSSubhead(
                'SuffixIcon',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _headers() {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _header = !_header;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio(
                visualDensity: VisualDensity.compact,
                value: true,
                groupValue: _header,
                onChanged: (val) {
                  setState(() {
                    _header = !_header;
                  });
                },
              ),
              MDSSubhead(
                'Header',
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _headerAction = !_headerAction;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Radio(
                visualDensity: VisualDensity.compact,
                value: true,
                groupValue: _headerAction,
                onChanged: (val) {
                  setState(() {
                    _headerAction = !_headerAction;
                  });
                },
              ),
              MDSSubhead(
                'HeaderWithAction',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
