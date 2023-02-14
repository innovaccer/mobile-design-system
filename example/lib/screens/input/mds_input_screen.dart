import 'package:example/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:innovaccer_design_system/innovaccer_design_system.dart';

import '../../widget/example_app_bar.dart';

class MDSInputScreen extends StatefulWidget {
  static const String routeName = '/mds_input_screen';

  @override
  _MDSInputScreenState createState() => _MDSInputScreenState();
}

class _MDSInputScreenState extends State<MDSInputScreen> with SpacingMixin {
  late GlobalKey<FormFieldState> _key1,
      _key2,
      _key3,
      _key4,
      _key5,
      _key6,
      _key7,
      _key8,
      _key9;
  late TextEditingController _controller1,
      _controller2,
      _controller3,
      _controller4,
      _controller5,
      _controller6,
      _controller7,
      _controller8,
      _controller9;

  @override
  void initState() {
    super.initState();
    _key1 = GlobalKey<FormFieldState>();
    _key2 = GlobalKey<FormFieldState>();
    _key3 = GlobalKey<FormFieldState>();
    _key4 = GlobalKey<FormFieldState>();
    _key5 = GlobalKey<FormFieldState>();
    _key6 = GlobalKey<FormFieldState>();
    _key7 = GlobalKey<FormFieldState>();
    _key8 = GlobalKey<FormFieldState>();
    _key9 = GlobalKey<FormFieldState>();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    _controller5 = TextEditingController();
    _controller6 = TextEditingController();
    _controller7 = TextEditingController();
    _controller8 = TextEditingController();
    _controller9 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExampleAppBar(
        title: 'MDSInput',
        buildContext: context,
      ),
      body: Padding(
        padding: p4,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: pb2,
              child: MDSBody('1. Simple MDSInput',
                  appearance: BodyAppearance.medium),
            ),
            MDSInput(
              textInputType: TextInputType.text,
              parentContext: context,
              textFormFieldKey: _key1,
              textEditingController: _controller1,
              isClearButtonEnabled: true,
            ),
            SizedBox(
              height: spacing2,
            ),
            Padding(
              padding: pb2,
              child: MDSBody('2. Number MDSInput',
                  appearance: BodyAppearance.medium),
            ),
            MDSInput(
              textInputType: TextInputType.number,
              parentContext: context,
              textFormFieldKey: _key2,
              textEditingController: _controller2,
            ),
            SizedBox(
              height: spacing2,
            ),
            Padding(
              padding: pb2,
              child: MDSBody('3. Phone Number MDSInput',
                  appearance: BodyAppearance.medium),
            ),
            MDSInput(
              parentContext: context,
              textInputType: TextInputType.phone,
              textFormFieldKey: _key3,
              textEditingController: _controller3,
              numberOfCharactersAllowed: 10,
              placeholderText: 'Phone Number',
            ),
            SizedBox(
              height: spacing2,
            ),
            Padding(
              padding: pb2,
              child: MDSBody('4. Password MDSInput',
                  appearance: BodyAppearance.medium),
            ),
            MDSInput(
              textInputType: TextInputType.visiblePassword,
              parentContext: context,
              textFormFieldKey: _key4,
              textEditingController: _controller4,
              placeholderText: 'Enter you Password',
            ),
            SizedBox(
              height: spacing2,
            ),
            Padding(
              padding: pb2,
              child: MDSBody('5. Metric MDSInput',
                  appearance: BodyAppearance.medium),
            ),
            MDSInput(
              parentContext: context,
              textFormFieldKey: _key5,
              textEditingController: _controller5,
              isMetric: true,
            ),
            SizedBox(
              height: spacing2,
            ),
            Padding(
              padding: pb2,
              child: MDSBody('6. MDSInput with Prefix and Suffix Icon',
                  appearance: BodyAppearance.medium),
            ),
            MDSInput(
              parentContext: context,
              textFormFieldKey: _key6,
              textEditingController: _controller6,
              suffixIcon: Icons.person,
              prefixIcon: Icons.info,
              placeholderText: 'Name',
            ),
            SizedBox(
              height: spacing2,
            ),
            Padding( 
              padding: pb2,
              child: MDSBody('7. MDSInput with Prefix and Suffix Text',
                  appearance: BodyAppearance.medium),
            ),
            MDSInput(
              parentContext: context,
              textInputType: TextInputType.number,
              textFormFieldKey: _key7,
              textEditingController: _controller7,
              suffixText: 'years',
              prefixText: 'Age',
              helperText: 'You should be greater that 12 years',
            ),
            SizedBox(
              height: spacing2,
            ),
            Padding(
              padding: pb2,
              child: MDSBody(
                  '8. Compulsory MDSInput with label and helper Text',
                  appearance: BodyAppearance.medium),
            ),
            MDSInput(
              parentContext: context,
              textFormFieldKey: _key8,
              textEditingController: _controller8,
              prefixIcon: Icons.mail,
              labelText: 'Email address',
              helperText: "We'll send you an email to verify your account",
              isCompulsory: true,
              placeholderText: 'Enter Email',
              validator: Common.validateEmail,
            ),
            SizedBox(
              height: spacing2,
            ),
            Padding(
              padding: pb2,
              child: MDSBody('9. Verification Code MDSInput',
                  appearance: BodyAppearance.medium),
            ),
            MDSInput(
              parentContext: context,
              textFormFieldKey: _key9,
              textEditingController: _controller9,
              isVerificationCode: true,
              verificationCodeLength: 6,
              isVerificationCodeNumberOnly: false,
            ),
            SizedBox(
              height: spacing4,
            ),
          ],
        ),
      ),
    );
  }
}
