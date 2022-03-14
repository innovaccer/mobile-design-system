import 'dart:io';

import 'package:example/screens/action_sheet/mds_action_sheet_screen.dart';
import 'package:example/screens/bottom_sheet/mds_bottom_sheet_screen.dart';
import 'package:example/screens/buttons/button/mds_button_screen.dart';
import 'package:example/screens/buttons/button_screen.dart';
import 'package:example/screens/buttons/icon_button/mds_icon_button_screen.dart';
import 'package:example/screens/buttons/label_button/mds_label_button_screen.dart';
import 'package:example/screens/card/mds_card_screen.dart';
import 'package:example/screens/home_screen.dart';
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
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/router/route_handlers.dart';

class AppRouter with RouteHandlers {
  fluro.FluroRouter? _router;

  /// Private Constructor
  AppRouter._() {
    _router = fluro.FluroRouter();
  }

  /// Singleton object of [AppRouter] class
  static final AppRouter shared = AppRouter._();

  /// Function to link all the routes with their respective handlers
  void setUpRouter() {
    _configureRoutes();
  }

  void _configureRoutes() {
    fluro.TransitionType transitionType;
    if (kIsWeb) {
      transitionType = fluro.TransitionType.fadeIn;
    } else if (Platform.isIOS) {
      transitionType = fluro.TransitionType.cupertino;
    } else {
      transitionType = fluro.TransitionType.material;
    }

    _router!.define(
      HomeScreen.routeName,
      handler: homeScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      PageHeadersScreen.routeName,
      handler: pageHeaderScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSCompactPageHeaderScreen.routeName,
      handler: compactPageHeaderScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSBasicPageHeaderScreen.routeName,
      handler: basicPageHeaderScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSPageHeaderWithOutSubHeadingScreen.routeName,
      handler: withOutSubheadingPageHeaderScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSPageHeaderWithSubHeadingScreen.routeName,
      handler: withSubheadingPageHeaderScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      TypographyScreen.routeName,
      handler: typographyScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      TextScalerScreen.routeName,
      handler: textScalerScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSTitleScreen.routeName,
      handler: mdsTitleScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSCaptionScreen.routeName,
      handler: mdsCaptionScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSBodyScreen.routeName,
      handler: mdsBodyScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSSubheadScreen.routeName,
      handler: mdsSubheadScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSHeadlineScreen.routeName,
      handler: mdsHeadlineScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSLinkScreen.routeName,
      handler: mdsLinkScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSFootnoteScreen.routeName,
      handler: mdsFootnoteScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      ButtonScreen.routeName,
      handler: buttonScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSButtonScreen.routeName,
      handler: mdsButtonScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSIconButtonScreen.routeName,
      handler: mdsIconButtonScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSLabelButtonScreen.routeName,
      handler: mdsLabelButtonScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSActionSheetScreen.routeName,
      handler: mdsActionSheetScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSCardScreen.routeName,
      handler: mdsCardScreenHandler,
      transitionType: transitionType,
    );
    _router!.define(
      MDSBottomSheetScreen.routeName,
      handler: mdsBottomSheetScreenHandler,
      transitionType: transitionType,
    );
  }

  /// Function to handle unknown routes
  Route<dynamic>? unKnownRouteHandler(RouteSettings? routeSettings) {
    return MaterialPageRoute(builder: (context) => HomeScreen());
  }

  /// Function to generate the Route handlers
  Route<dynamic>? generator(RouteSettings? routeSettings) {
    return _router!.generator(routeSettings!);
  }
}
