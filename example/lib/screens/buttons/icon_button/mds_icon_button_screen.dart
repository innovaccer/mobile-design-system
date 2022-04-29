import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

class MDSIconButtonScreen extends StatefulWidget {
  static const String routeName = '/mds_icon_button_screen';

  @override
  _MDSIconButtonScreenState createState() => _MDSIconButtonScreenState();
}

class _MDSIconButtonScreenState extends State<MDSIconButtonScreen>
    with SpacingMixin, ColorMixin {
  late IconButtonType _type;
  late IconButtonState _state;

  @override
  void initState() {
    super.initState();
    _type = IconButtonType.basic;
    _state = IconButtonState.defaultType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MDSTitle(
          'MDSIconButton',
          type: TitleType.title3,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: px4,
                    child: MDSIconButton(
                      icon: Icons.search,
                      onTap: () {
                        print('tapped!!');
                      },
                      state: _state,
                      type: _type,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Expanded(
            flex: 8,
            child: Container(
              padding: px4 + pt2,
              child: ListView(
                padding: p0,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: MDSSubhead('Type'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Wrap(
                          children: [
                            _typeOptionWidget(
                              value: IconButtonType.basic,
                              groupValue: _type,
                              displayText: 'basic',
                            ),
                            _typeOptionWidget(
                              value: IconButtonType.transparent,
                              groupValue: _type,
                              displayText: 'transparent',
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
                        flex: 3,
                        child: MDSSubhead('State'),
                      ),
                      Expanded(
                        flex: 7,
                        child: Wrap(
                          children: [
                            _stateOptionWidget(
                              value: IconButtonState.active,
                              groupValue: _state,
                              displayText: 'active',
                            ),
                            _stateOptionWidget(
                              value: IconButtonState.defaultType,
                              groupValue: _state,
                              displayText: 'default',
                            ),
                            _stateOptionWidget(
                              value: IconButtonState.disabled,
                              groupValue: _state,
                              displayText: 'disabled',
                            ),
                            _stateOptionWidget(
                              value: IconButtonState.loading,
                              groupValue: _state,
                              displayText: 'loading',
                            ),
                            _stateOptionWidget(
                              value: IconButtonState.selected,
                              groupValue: _state,
                              displayText: 'selected',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: spacing6,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _typeOptionWidget({
    required IconButtonType value,
    required IconButtonType groupValue,
    required String displayText,
  }) {
    return GestureDetector(
      onTap: () => _updateType(value),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: value,
            groupValue: groupValue,
            onChanged: _updateType,
          ),
          MDSBody(
            displayText,
          ),
        ],
      ),
    );
  }

  void _updateType(IconButtonType? value) {
    setState(() {
      _type = value!;
    });
  }

  Widget _stateOptionWidget({
    required IconButtonState value,
    required IconButtonState groupValue,
    required String displayText,
  }) {
    return GestureDetector(
      onTap: () => _updateState(value),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Radio(
            visualDensity: VisualDensity.compact,
            value: value,
            groupValue: groupValue,
            onChanged: _updateState,
          ),
          MDSBody(
            displayText,
          ),
        ],
      ),
    );
  }

  void _updateState(IconButtonState? value) {
    setState(() {
      _state = value!;
    });
  }
}
