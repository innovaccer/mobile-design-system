import 'package:example/screens/action_sheet/mds_action_sheet_screen.dart';
import 'package:example/screens/avatar/mds_avatar_screen.dart';
import 'package:example/screens/badge/mds_badge_screen.dart';
import 'package:example/screens/bottom_sheet/mds_bottom_sheet_screen.dart';
import 'package:example/screens/buttons/button/mds_button_screen.dart';
import 'package:example/screens/buttons/button_screen.dart';
import 'package:example/screens/buttons/icon_button/mds_icon_button_screen.dart';
import 'package:example/screens/buttons/label_button/mds_label_button_screen.dart';
import 'package:example/screens/card/mds_card_screen.dart';
import 'package:example/screens/input/mds_input_screen.dart';
import 'package:example/screens/list/mds_list_screen.dart';
import 'package:example/screens/page_header/mds_basic_header/mds_basic_page_header_screen.dart';
import 'package:example/screens/page_header/mds_compact_page_header/mds_compact_header_screen.dart';
import 'package:example/screens/page_header/mds_page_header_with_subHeading/mds_page_header_with_subHeading_screen.dart';
import 'package:example/screens/page_header/mds_page_header_without_subHeading/mds_page_header_without_subHeading_screen.dart';
import 'package:example/screens/pills/mds_pills_screen.dart';
import 'package:example/screens/switch/mds_switch_screen.dart';
import 'package:example/screens/typography/body/mds_body_screen.dart';
import 'package:example/screens/typography/caption/mds_caption_screen.dart';
import 'package:example/screens/typography/footnote/mds_footnote_screen.dart';
import 'package:example/screens/typography/headline/mds_headline_screen.dart';
import 'package:example/screens/typography/link/mds_link_screen.dart';
import 'package:example/screens/typography/scaler/text_scaler_screen.dart';
import 'package:example/screens/typography/subhead/mds_subhead_screen.dart';
import 'package:example/screens/typography/title/mds_title_screen.dart';
import 'package:example/screens/typography/typography_screen.dart';
import '../screens/page_header/page_header_screen.dart';

class Constants {
  /// title and routes of all core-ui widgets
  static final Map<String, String> widgetMap = {
    'Typography': TypographyScreen.routeName,
    'Buttons': ButtonScreen.routeName,
    'PageHeaders': PageHeadersScreen.routeName,
    'Action Sheet': MDSActionSheetScreen.routeName,
    'Card': MDSCardScreen.routeName,
    'Bottom Sheet': MDSBottomSheetScreen.routeName,
    'List': MDSListScreen.routeName,
    'Input': MDSInputScreen.routeName,
    'Avatar': MDSAvatarScreen.routeName,
    // 'Toast': MDSToastScreen.routeName,
    'Badge': MDSBadgeScreen.routeName,
    'Pills': MDSPillsScreen.routeName,
    'Switch': MDSSwitchScreen.routeName,
  };

  /// title and routes of all typography widgets
  static final Map<String, String> typographyWidgetMap = {
    'MDSTitle': MDSTitleScreen.routeName,
    'MDSBody': MDSBodyScreen.routeName,
    'MDSHeadline': MDSHeadlineScreen.routeName,
    'MDSSubhead': MDSSubheadScreen.routeName,
    'MDSFootnote': MDSFootnoteScreen.routeName,
    'MDSCaption': MDSCaptionScreen.routeName,
    'MDSLink': MDSLinkScreen.routeName,
    'TextScaler': TextScalerScreen.routeName,
  };

  /// title and routes of all button widgets
  static final Map<String, String> buttonWidgetMap = {
    'MDSButton': MDSButtonScreen.routeName,
    'MDSIconButton': MDSIconButtonScreen.routeName,
    'MDSLabelButton': MDSLabelButtonScreen.routeName,
  };

  /// title and routes of all pageHeader widgets
  static final Map<String, String> pageHeaderWidgetMap = {
    'MDSCompactHeader': MDSCompactPageHeaderScreen.routeName,
    'MDSBasicHeader': MDSBasicPageHeaderScreen.routeName,
    'MDSHeaderWithoutSubheading': MDSPageHeaderWithOutSubHeadingScreen.routeName,
    'MDSHeaderWithSubheading': MDSPageHeaderWithSubHeadingScreen.routeName,
  };
}
