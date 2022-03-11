import 'package:example/screens/page_header/mds_basic_header/mds_basic_page_header_screen.dart';
import 'package:example/screens/page_header/mds_compact_page_header/mds_compact_header_screen.dart';
import 'package:example/screens/page_header/mds_page_header_with_subHeading/mds_page_header_with_subHeading_screen.dart';
import 'package:example/screens/page_header/mds_page_header_without_subHeading/mds_page_header_without_subHeading_screen.dart';
import 'package:example/screens/page_header/page_header_screen.dart';
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
    return
      MDSPageHeaderWithOutSubHeadingScreen();

  });
  var withSubheadingPageHeaderScreenHandler = Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MDSPageHeaderWithSubHeadingScreen();
  });
}
