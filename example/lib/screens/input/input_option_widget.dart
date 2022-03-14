import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

//ignore: must_be_immutable
class InputOptionWidget extends StatelessWidget {
  final String text;
  final Function callback;
  bool checked;

  InputOptionWidget(
    this.text,
    this.callback,
    this.checked,
  );

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Colors.blue;
    }

    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: checked,
            onChanged: (value) {
              // callback(value);
            },
          ),
          MDSSubhead(
            text,
          ),
        ],
      ),
    );
  }
}
