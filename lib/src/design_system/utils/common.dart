import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

enum DeviceType { mobile, tab }

enum PlatformType { iOS, android, web }

class MDSCommon with SpacingMixin {
  /// Function to get the current platform on which the app is running
  static PlatformType getPlatform() {
    if (kIsWeb) {
      return PlatformType.web;
    } else {
      if (Platform.isIOS) {
        return PlatformType.iOS;
      } else {
        return PlatformType.android;
      }
    }
  }

  /// function to check if the current platform is [PlatformType.iOS] or not
  static bool isIOS() {
    return getPlatform() == PlatformType.iOS;
  }

  /// function to check if the current platform is [PlatformType.android] or not
  static bool isAndroid() {
    return getPlatform() == PlatformType.android;
  }

  /// function to check if the current platform is [PlatformType.web] or not
  static bool isWeb() {
    return getPlatform() == PlatformType.web;
  }

  /// Function to get the current device ([Mobile] / [Tab]) on which the app is running
  static DeviceType getDevice({required BuildContext context}) {
    if (MediaQuery.of(context).size.shortestSide > MDSConstants.tabBreakPoint) {
      return DeviceType.tab;
    } else {
      return DeviceType.mobile;
    }
  }

  /// Function to check if the current device is [Tab] or not
  static bool isTab({required BuildContext context}) {
    return getDevice(context: context) == DeviceType.tab;
  }

  /// Function to check if the current device is [Mobile] or not
  static bool isMobile({required BuildContext context}) {
    return getDevice(context: context) == DeviceType.mobile;
  }

  /// Function to get the current width of the screen.
  static double getScreenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  /// Function to get the current size of the screen.
  static Size getScreenSize({required BuildContext context}) {
    return MediaQuery.of(context).size;
  }

  /// Function to get the current height of the screen.
  static double getScreenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  /// Function to get the status bar height of the screen.
  static double getStatusBarHeight({required BuildContext context}) {
    return MediaQuery.of(context).padding.top;
  }

  /// Function to get the bottom bar height of the screen. [Offset from bottom]
  static double getBottomBarHeight({required BuildContext context}) {
    return MediaQuery.of(context).padding.bottom;
  }

  /// Function to get the current device orientation
  static Orientation getDeviceOrientation({required BuildContext context}) {
    return MediaQuery.of(context).orientation;
  }

  /// Function to tell if the device is in [Portrait] mode or not
  static bool isPortrait({required BuildContext context}) {
    return getDeviceOrientation(context: context) == Orientation.portrait;
  }

  /// Function to tell if the device is in [Landscape] mode or not
  static bool isLandscape({required BuildContext context}) {
    return getDeviceOrientation(context: context) == Orientation.landscape;
  }
}
