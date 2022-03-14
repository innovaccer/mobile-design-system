import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

//ignore: must_be_immutable
class CheckBoxWidget extends StatelessWidget {
  final String text;
  final Function(bool) callback;
  bool checked;

  CheckBoxWidget(
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
        callback(!checked);
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: checked,
            onChanged: (bool? value) {
              callback(value!);
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
