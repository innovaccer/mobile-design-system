import 'dart:io';

import 'package:example/screens/home_screen.dart';
import 'package:example/screens/page_header/mds_basic_header/mds_basic_page_header_screen.dart';
import 'package:example/screens/page_header/mds_compact_page_header/mds_compact_header_screen.dart';
import 'package:example/screens/page_header/mds_page_header_with_subHeading/mds_page_header_with_subHeading_screen.dart';
import 'package:example/screens/page_header/mds_page_header_without_subHeading/mds_page_header_without_subHeading_screen.dart';
import 'package:example/screens/page_header/page_header_screen.dart';
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
