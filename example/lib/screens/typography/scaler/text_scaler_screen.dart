import 'package:example/widget/example_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class TextScalerScreen extends StatefulWidget {
  static const String routeName = '/text_scaler_screen';

  @override
  _TextScalerScreenState createState() => _TextScalerScreenState();
}

class _TextScalerScreenState extends State<TextScalerScreen> with SpacingMixin, ColorMixin {
  double? sliderValue = 0.0;

  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      // ignore: unnecessary_null_comparison
      if (TextScaler.of<TextScalingFactor>(context) != null) {
        sliderValue = TextScaler.of<TextScalingFactor>(context)?.scaleFactor;
        sliderValue = (sliderValue ?? 0.0) - 1.0;
      }
      isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(
        title: 'Text Scaler',
        buildContext: context,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: p7,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MDSBody('This is a sample body'),
                      MDSFootnote('This is a sample footnote'),
                      MDSSubhead('This is a sample subhead'),
                      MDSTitle('This is a sample title'),
                      MDSButton(
                        title: 'This is a sample button',
                        onTap: () => print('button tapped'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(),
            Expanded(
              flex: 2,
              child: Container(
                padding: px6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MDSFootnote(
                      'Scale Factor ${(1 + (sliderValue ?? 0.0)).toStringAsFixed(2)}',
                    ),
                    Slider(
                      min: 0,
                      max: 1,
                      value: (sliderValue ?? 0.0),
                      onChanged: (value) {
                        // ignore: unnecessary_null_comparison
                        if (TextScaler.of<TextScalingFactor>(context) != null) {
                          TextScaler.update(context, TextScalingFactor(scaleFactor: 1.0 + value));
                          sliderValue = value;
                        } else {
                          setState(() {
                            sliderValue = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
