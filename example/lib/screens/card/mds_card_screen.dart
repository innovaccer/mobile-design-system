import 'package:example/widget/example_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSCardScreen extends StatefulWidget {
  static const String routeName = '/mds_card_screen';

  @override
  _MDSCardScreenState createState() => _MDSCardScreenState();
}

class _MDSCardScreenState extends State<MDSCardScreen>
    with SpacingMixin, ColorMixin {
  late bool isFlatCard;
  Widget? body;
  late String? title;
  late String? subTitle;
  late IconData subTitleIcon;
  late bool isSubTitleOnTop;
  late String? footerLabelText;
  late Function() onFooterTap;
  late IconData footerPrefixIcon;
  late IconData footerSuffixIcon;
  late IconData headerSuffixIcon;
  late Function onHeaderSuffixIconTap;
  late String? actionText1;
  late String? actionText2;
  late Function onAction1Tap;
  late Function onAction2Tap;
  late bool footerEnabled;
  Widget? mediaWidgetOnTop;

  @override
  void initState() {
    super.initState();
    isFlatCard = false;
    title = 'Card Title';
    subTitle = 'Subtitle';
    subTitleIcon = Icons.event;
    headerSuffixIcon = Icons.more_vert;
    isSubTitleOnTop = false;
    body = _bodyWidget();
    actionText1 = 'Action 1';
    actionText2 = 'Action 2';
    footerLabelText = 'Footer Text';
    footerPrefixIcon = Icons.event;
    footerSuffixIcon = Icons.chevron_right;
    onHeaderSuffixIconTap =
        () => print('onHeaderSuffixIconTap');
    onAction1Tap = () => print('onAction1Tap');
    onAction2Tap = () => print('onAction2Tap');
    onFooterTap = () => print('onFooterTap');
    footerEnabled = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(
        title: 'MDSCard',
        buildContext: context,
      ),
      body: Column(
        children: [
          Expanded(
            flex: mediaWidgetOnTop != null ? 7 : 5,
            child: Padding(
              padding: p4,
              child: Center(
                child: MDSCard(
                  isFlatCard: isFlatCard,
                  title: title,
                  subTitle: subTitle,
                  subTitlePrefixIcon: subTitleIcon,
                  headerSuffixIcon: headerSuffixIcon,
                  isSubTitleOnTop: isSubTitleOnTop,
                  onHeaderSuffixIconTap: onHeaderSuffixIconTap,
                  body: body,
                  actionText1: actionText1,
                  actionText2: actionText2,
                  footerLabelText: footerLabelText,
                  footerPrefixIcon: footerPrefixIcon,
                  footerSuffixIcon: footerSuffixIcon,
                  onAction1Tap: onAction1Tap,
                  onAction2Tap: onAction2Tap,
                  onFooterTap: onFooterTap,
                  mediaWidgetOnTop: mediaWidgetOnTop,
                ),
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: mediaWidgetOnTop != null ? 3 : 5,
            child: Container(
              padding: px4,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: MDSSubhead('Flat card'),
                      ),
                      Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MDSCommon.isAndroid()
                                ? Switch(
                                    value: isFlatCard,
                                    onChanged: _changeCardType,
                                  )
                                : CupertinoSwitch(
                                    value: isFlatCard,
                                    onChanged: _changeCardType,
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
                        flex: 4,
                        child: MDSSubhead('Header'),
                      ),
                      Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MDSCommon.isAndroid()
                                ? Switch(
                                    value: title != null,
                                    onChanged: _updateTitle,
                                  )
                                : CupertinoSwitch(
                                    value: title != null,
                                    onChanged: _updateTitle,
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
                        flex: 4,
                        child: MDSSubhead('Body'),
                      ),
                      Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MDSCommon.isAndroid()
                                ? Switch(
                                    value: body != null,
                                    onChanged: _updateBody,
                                  )
                                : CupertinoSwitch(
                                    value: body != null,
                                    onChanged: _updateBody,
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
                        flex: 4,
                        child: MDSSubhead('Footer'),
                      ),
                      Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MDSCommon.isAndroid()
                                ? Switch(
                                    value: footerEnabled,
                                    onChanged: _updateFooter,
                                  )
                                : CupertinoSwitch(
                                    value: footerEnabled,
                                    onChanged: _updateFooter,
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
                        flex: 4,
                        child: MDSSubhead('Sub Title'),
                      ),
                      Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MDSCommon.isAndroid()
                                ? Switch(
                                    value: subTitle != null,
                                    onChanged: _updateSubTitle,
                                  )
                                : CupertinoSwitch(
                                    value: subTitle != null,
                                    onChanged: _updateSubTitle,
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
                        flex: 4,
                        child: MDSSubhead('Subtitle on top'),
                      ),
                      Expanded(
                        flex: 6,
                        child: IgnorePointer(
                          ignoring: subTitle == null,
                          child: Opacity(
                            opacity: subTitle == null ? 0.5 : 1.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MDSCommon.isAndroid()
                                    ? Switch(
                                        value: isSubTitleOnTop,
                                        onChanged: _moveSubtitleToTop,
                                      )
                                    : CupertinoSwitch(
                                        value: isSubTitleOnTop,
                                        onChanged: _moveSubtitleToTop,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: MDSSubhead('Actions in footer'),
                      ),
                      Expanded(
                        flex: 6,
                        child: IgnorePointer(
                          ignoring: !footerEnabled,
                          child: Opacity(
                            opacity: footerEnabled ? 1 : 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MDSCommon.isAndroid()
                                    ? Switch(
                                        value: actionText1 != null &&
                                            actionText2 != null,
                                        onChanged: _enableActionsInFooter,
                                      )
                                    : CupertinoSwitch(
                                        value: actionText1 != null &&
                                            actionText2 != null,
                                        onChanged: _enableActionsInFooter,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: MDSSubhead('Media on top'),
                      ),
                      Expanded(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MDSCommon.isAndroid()
                                ? Switch(
                                    value: mediaWidgetOnTop != null,
                                    onChanged: _updateMediaWidget,
                                  )
                                : CupertinoSwitch(
                                    value: mediaWidgetOnTop != null,
                                    onChanged: _updateMediaWidget,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: spacing2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MDSSubhead(
                    'First name',
                    appearance: SubheadAppearance.subtle,
                  ),
                  SizedBox(height: spacing1),
                  MDSBody(
                    'Joy',
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MDSSubhead(
                    'Last name',
                    appearance: SubheadAppearance.subtle,
                  ),
                  SizedBox(height: spacing1),
                  MDSBody(
                    'Lawson',
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: spacing3,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MDSSubhead(
                    'Date of Birth',
                    appearance: SubheadAppearance.subtle,
                  ),
                  SizedBox(height: spacing1),
                  MDSBody(
                    '02/01/1980',
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MDSSubhead(
                    'Gender',
                    appearance: SubheadAppearance.subtle,
                  ),
                  SizedBox(height: spacing1),
                  MDSBody(
                    'Male',
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _mediaWidget() {
    return Image.asset(
      'asset/png/placeholder.png',
      height: 160,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }

  void _changeCardType(bool value) {
    setState(() {
      isFlatCard = value;
    });
  }

  void _updateSubTitle(bool value) {
    setState(() {
      subTitle = subTitle != null ? null : 'Subtitle';
    });
  }

  void _updateTitle(bool value) {
    setState(() {
      title = title != null ? null : 'Title';
    });
  }

  void _updateBody(bool value) {
    setState(() {
      body = body != null ? null : _bodyWidget();
    });
  }

  void _updateFooter(bool value) {
    if (footerEnabled) {
      setState(() {
        actionText1 = null;
        actionText2 = null;
        footerLabelText = null;
        footerEnabled = false;
      });
    } else {
      setState(() {
        actionText1 = 'Action 1';
        actionText2 = 'Action 2';
        footerLabelText = 'Footer Text';
        footerEnabled = true;
      });
    }
  }

  void _updateMediaWidget(bool value) {
    setState(() {
      mediaWidgetOnTop = mediaWidgetOnTop != null ? null : _mediaWidget();
    });
  }

  void _moveSubtitleToTop(bool value) {
    setState(() {
      isSubTitleOnTop = value;
    });
  }

  void _enableActionsInFooter(bool value) {
    setState(() {
      actionText1 = actionText1 != null ? null : 'Action 1';
      actionText2 = actionText2 != null ? null : 'Action 2';
    });
  }
}
