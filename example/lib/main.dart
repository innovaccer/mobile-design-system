import 'package:example/screens/home_screen.dart';
import 'package:example/utils/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';
import 'utils/locator/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AppRouter.shared.setUpRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextScaler<TextScalingFactor>(
      initialScaleFactor: TextScalingFactor(scaleFactor: 1.0),
      child:  MDSToast(
        child: MaterialApp(
            title: 'Core UI Examples',
            debugShowCheckedModeBanner: false,
            navigatorKey: appNavigator.navigatorKey,
            onGenerateRoute: AppRouter.shared.generator,
            onUnknownRoute: AppRouter.shared.unKnownRouteHandler,
            initialRoute: HomeScreen.routeName,
          ),
      ),

    );
  }
}