import 'package:example/screens/page_header/mds_basic_header/mds_basic_page_header_screen.dart';
import 'package:example/screens/page_header/mds_compact_page_header/mds_compact_header_screen.dart';
import 'package:example/screens/page_header/mds_page_header_with_subHeading/mds_page_header_with_subHeading_screen.dart';
import 'package:example/screens/page_header/mds_page_header_without_subHeading/mds_page_header_without_subHeading_screen.dart';
import 'package:example/screens/page_header/page_header_screen.dart';

class Constants {
  /// title and routes of all core-ui widgets
  static final Map<String, String> widgetMap = {
    'PageHeaders': PageHeadersScreen.routeName,
    // 'Toast': MDSToastScreen.routeName,
  };

  /// title and routes of all pageHeader widgets
  static final Map<String, String> pageHeaderWidgetMap = {
    'MDSCompactHeader': MDSCompactPageHeaderScreen.routeName,
    'MDSBasicHeader': MDSBasicPageHeaderScreen.routeName,
    'MDSHeaderWithoutSubheading': MDSPageHeaderWithOutSubHeadingScreen.routeName,
    'MDSHeaderWithSubheading': MDSPageHeaderWithSubHeadingScreen.routeName,
  };
}
