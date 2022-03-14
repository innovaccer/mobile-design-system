import 'package:example/screens/action_sheet/mds_action_sheet_screen.dart';
import 'package:example/screens/bottom_sheet/mds_bottom_sheet_screen.dart';
import 'package:example/screens/buttons/button/mds_button_screen.dart';
import 'package:example/screens/buttons/button_screen.dart';
import 'package:example/screens/buttons/icon_button/mds_icon_button_screen.dart';
import 'package:example/screens/buttons/label_button/mds_label_button_screen.dart';
import 'package:example/screens/card/mds_card_screen.dart';
import 'package:example/screens/list/mds_list_screen.dart';
import 'package:example/screens/page_header/mds_basic_header/mds_basic_page_header_screen.dart';
import 'package:example/screens/page_header/mds_compact_page_header/mds_compact_header_screen.dart';
import 'package:example/screens/page_header/mds_page_header_with_subHeading/mds_page_header_with_subHeading_screen.dart';
import 'package:example/screens/page_header/mds_page_header_without_subHeading/mds_page_header_without_subHeading_screen.dart';
import 'package:example/screens/page_header/page_header_screen.dart';
import 'package:example/screens/typography/body/mds_body_screen.dart';
import 'package:example/screens/typography/caption/mds_caption_screen.dart';
import 'package:example/screens/typography/footnote/mds_footnote_screen.dart';
import 'package:example/screens/typography/headline/mds_headline_screen.dart';
import 'package:example/screens/typography/link/mds_link_screen.dart';
import 'package:example/screens/typography/scaler/text_scaler_screen.dart';
import 'package:example/screens/typography/subhead/mds_subhead_screen.dart';
import 'package:example/screens/typography/title/mds_title_screen.dart';
import 'package:example/screens/typography/typography_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../screens/home_screen.dart';

mixin RouteHandlers {
  var homeScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return HomeScreen();
  });

  var pageHeaderScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return PageHeadersScreen();
  });
  var compactPageHeaderScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSCompactPageHeaderScreen();
  });
  var basicPageHeaderScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSBasicPageHeaderScreen();
  });
  var withOutSubheadingPageHeaderScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSPageHeaderWithOutSubHeadingScreen();
  });
  var withSubheadingPageHeaderScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSPageHeaderWithSubHeadingScreen();
  });

  var typographyScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return TypographyScreen();
  });

  var textScalerScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return TextScalerScreen();
  });

  var mdsTitleScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSTitleScreen();
  });

  var mdsCaptionScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSCaptionScreen();
  });

  var mdsBodyScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSBodyScreen();
  });

  var mdsSubheadScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSSubheadScreen();
  });

  var mdsHeadlineScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSHeadlineScreen();
  });

  var mdsLinkScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSLinkScreen();
  });

  var mdsFootnoteScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSFootnoteScreen();
  });

  var buttonScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return ButtonScreen();
  });

  var mdsButtonScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSButtonScreen();
  });

  var mdsIconButtonScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSIconButtonScreen();
  });

  var mdsLabelButtonScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSLabelButtonScreen();
  });

  var mdsActionSheetScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSActionSheetScreen();
  });

  var mdsCardScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSCardScreen();
  });
  var mdsBottomSheetScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSBottomSheetScreen();
  });
  var mdsListScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSListScreen();
  });
}
