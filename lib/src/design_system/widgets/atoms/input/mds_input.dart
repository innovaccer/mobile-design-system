library core_ui;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:decimal/decimal.dart';

import '../../../../../innovaccer_design_system.dart';

class MDSInput extends StatefulWidget {
  /// [placeholderText] will be displayed initially inside [MDSInput]
  /// to give a hint of the kind of input to be entered
  final String? placeholderText;

  /// [validator] function used to validate the text input
  /// If the user enters valid text, the [MDSInput] appears normally without any warnings to the user
  /// make sure to pass [textFormFieldKey] to validate [MDSInput]
  final FormFieldValidator<String>? validator;

  /// [textInputType] take the input as text, number...etc
  final TextInputType? textInputType;

  /// to retrieve the text from [ITextFormField] [textEditingController] is used
  final TextEditingController? textEditingController;

  /// maximum no of characters allowed is controlled by [numberOfCharactersAllowed]
  final int? numberOfCharactersAllowed;

  /// to get current state of [MDSInput], [textFormFieldKey] is used
  /// make sure that when there is validation then pass [textFormFieldKey] in [MDSInput]
  final GlobalKey<FormFieldState>? textFormFieldKey;

  /// [textAlignment] used to align text in [MDSInput]
  final TextAlign? textAlignment;

  /// [parentContext] needs to show/hide overlay done button in parent screen
  /// for iOS when [textInputType] is number
  final BuildContext? parentContext;

  /// [textCapitalization] configures how the platform keyboard will select an uppercase or
  /// lowercase keyboard
  final TextCapitalization? textCapitalization;

  /// [isReadOnly] depicts whether text can be changed.
  final bool? isReadOnly;

  /// [textFieldFocusCallback] called when [MDSInput] comes in focus
  final Function? textFieldFocusCallback;

  /// [textFieldUnFocusCallback] called when [MDSInput] focus is removed
  final Function? textFieldUnFocusCallback;

  /// [textFieldOnTap] callback is called when [MDSInput] is tapped
  final Function? textFieldOnTap;

  /// use [isInitialFocus] to give focus initially without clicking on [MDSInput]
  final bool? isInitialFocus;

  /// [textInputAction] will define an action the user has requested the text input control to perform.
  /// It also configures the keyboard to display a certain kind of action button
  final TextInputAction? textInputAction;

  /// [maxLines] used to give maximum no lines that will display
  /// in [MDSInput], it will expand the height of [MDSInput]
  final int? maxLines;

  /// [minLines] will control the minimum number of lines in [MDSInput]
  /// remember minLines can't be greater than maxLines
  final int? minLines;

  /// [isMultiLine] will indicate whether the textFormField will contain multiple lines input or not
  final bool? isMultiLine;

  /// [prefixIcon] will be placed at most left side of [MDSInput]
  final IconData? prefixIcon;

  /// [suffixIcon] will be placed at most right side of [MDSInput]
  final IconData? suffixIcon;

  /// [prefixIconCallback] is called when [prefixIcon] is pressed
  final Function? prefixIconCallback;

  /// [suffixIconCallback] is called when [suffixIcon] is pressed
  final Function? suffixIconCallback;

  /// if user want to hide text like in password then user [isObscureText]
  final bool? isObscureText;

  /// pass [isUSPhoneNumber] true when user wants to enter phone number in
  /// US format else default is false
  final bool? isUSPhoneNumber;

  /// for enabling/disabling interactive selection
  final bool? isInteractiveSelectionEnabled;

  /// [suffixIconWidget] will be used to show custom widgets in place of suffix icon
  final Widget? suffixIconWidget;

  /// [onFieldSubmitted] will be called when the textFormField is submitted
  final Function(String)? onFieldSubmitted;

  /// [onSaved] will be called when the textFormField is saved
  final FormFieldSetter<String>? onSaved;

  /// [textFieldDidUpdate] will be called when value in textFormField changes
  final Function(String)? textFieldDidUpdate;

  /// background color of the textFormField
  final Color? backgroundColor;

  /// to show a suffix icon which will clear the textFormField when pressed
  final bool? isClearButtonEnabled;

  /// the list of input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// [textFieldFocusNode] will be used for handling focus changes in [MDSInput]
  /// remember to dispose when you pass it
  final FocusNode? textFieldFocusNode;

  /// [labelText] is shown above the textField
  final String? labelText;

  /// [helperText] is shown below the textField
  final String? helperText;

  /// [prefixText] is shown at starting-left of the textField
  final String? prefixText;

  /// [suffixText] is shown at ending-right of the textField
  final String? suffixText;

  /// to show red dot on right side of label text
  final bool? isCompulsory;

  /// this will act as increment/decrement field
  final bool? isMetric;

  final bool? isVerificationCode;

  final int? verificationCodeLength;

  MDSInput({
    required this.parentContext,
    required this.textEditingController,
    required this.textFormFieldKey,
    this.validator,
    this.textInputType,
    this.textFieldFocusCallback,
    this.textFieldUnFocusCallback,
    this.textFieldOnTap,
    this.textInputAction = TextInputAction.done,
    this.suffixIcon,
    this.prefixIcon,
    this.placeholderText,
    this.prefixIconCallback,
    this.suffixIconCallback,
    this.textCapitalization = TextCapitalization.none,
    this.textAlignment = TextAlign.left,
    this.minLines = 1,
    this.maxLines = 1,
    this.isMultiLine = false,
    this.isObscureText = false,
    this.isReadOnly = false,
    this.isInitialFocus = false,
    this.numberOfCharactersAllowed,
    this.isUSPhoneNumber = true,
    this.isInteractiveSelectionEnabled = true,
    this.suffixIconWidget,
    this.onFieldSubmitted,
    this.onSaved,
    this.textFieldDidUpdate,
    this.backgroundColor,
    this.isClearButtonEnabled = false,
    this.inputFormatters,
    this.textFieldFocusNode,
    this.labelText,
    this.helperText,
    this.prefixText,
    this.suffixText,
    this.isCompulsory = false,
    this.isMetric = false,
    this.isVerificationCode = false,
    this.verificationCodeLength = 4,
  }) : assert(textEditingController != null && parentContext != null,
            'Either textEditingController or parentContext is null');

  @override
  _MDSInputState createState() => _MDSInputState();
}

class _MDSInputState extends State<MDSInput>
    with SpacingMixin, ColorMixin, FontMixin {
  /// [_textFieldFocusNode] is the property for [MDSInput] used to
  /// get its focus
  late FocusNode _textFieldFocusNode;

  /// [_overlayEntry] is used to display something over keyboard
  late OverlayEntry? _overlayEntry;

  /// [_usNumberTextInputFormatter] works in [MDSInput] to display
  /// number in US format
  late UsNumberTextInputFormatter _usNumberTextInputFormatter;

  /// bool variable to stop validating the text field until first focus change.
  bool _isFirstFocus = true;

  /// local variable for obscureText
  late bool _obscureText;

  /// local variable for suffixIcon
  late IconData? _suffixIcon;

  /// local variable for prefixIcon
  late IconData? _prefixIcon;

  /// clear icon show at right in textField
  bool showClearButton = false;

  List<TextInputFormatter>? _inputFormatters;

  /// local value for metric
  late double _metricValue;

  TextInputType? _textInputType;

  @override
  void initState() {
    super.initState();
    _metricValue = 0;
    _obscureText = widget.isObscureText!;
    _suffixIcon = widget.suffixIcon;
    _prefixIcon = widget.prefixIcon;
    _textInputType = widget.textInputType;
    _textFieldFocusNode = widget.textFieldFocusNode ?? FocusNode();
    _overlayEntry = null;

    _textFieldFocusNode.addListener(_handleTextFieldFocusChange);

    /// to give focus initially as soon as the widget is built
    if (widget.isInitialFocus!) {
      _textFieldFocusNode.requestFocus();
    }

    /// ignoring all icons when maxLines > 1  e.g. Comment box
    if (widget.maxLines! > 1) {
      _suffixIcon = null;
      _prefixIcon = null;
    }

    /// when input type is phone and format is of US Type then limiting length
    /// to only (numberOfCharactersAllowed + 4) and restricting to digits only
    if (_textInputType == TextInputType.phone && widget.isUSPhoneNumber!) {
      _usNumberTextInputFormatter = UsNumberTextInputFormatter();
      _inputFormatters = [
        LengthLimitingTextInputFormatter(widget.numberOfCharactersAllowed! + 4),
        FilteringTextInputFormatter.digitsOnly,
        _usNumberTextInputFormatter,
      ];
    } else if (_textInputType == TextInputType.number) {
      /// when input type is phone then limiting length to only numberOfCharactersAllowed
      /// and restricting to digits only
      _inputFormatters = [
        LengthLimitingTextInputFormatter(widget.numberOfCharactersAllowed),
        FilteringTextInputFormatter.digitsOnly,
      ];
    } else if (_textInputType == TextInputType.visiblePassword) {
      _obscureText = true;
      _suffixIcon = null;
    } else {
      /// limiting length to only numberOfCharactersAllowed
      _inputFormatters = [
        LengthLimitingTextInputFormatter(widget.numberOfCharactersAllowed)
      ];
    }
    if (widget.isMetric!) {
      // restricting the user from type the invalid value
      _inputFormatters = [
        FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*'))
      ];
      _textInputType = TextInputType.number;
      widget.textEditingController!.text = _metricValue.toInt().toString();
    }
  }

  @override
  void dispose() {
    /// if focus node is passed from parent then we need to dispose it in parent only
    if (widget.textFieldFocusNode == null) {
      _textFieldFocusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// design for pin-field
    if (widget.isVerificationCode!) {
      return PinFieldAutoFill(
        key: widget.textFormFieldKey,
        controller: widget.textEditingController,
        decoration: BoxLooseDecoration(
          textStyle: TextStyle(fontSize: fontSize16, color: ColorToken.black),
          strokeColorBuilder: PinListenColorBuilder(primary, secondary),
          strokeWidth: spacing0_5,
          radius: Radius.circular(spacing2),
          bgColorBuilder:
              PinListenColorBuilder(ColorToken.white, ColorToken.white),
        ),
        cursor: Cursor(
          width: spacing0_5,
          color: primary,
          radius: Radius.circular(spacing0_5),
          enabled: true,
        ),
        focusNode: _textFieldFocusNode,
        codeLength: widget.verificationCodeLength!,
        currentCode: widget.textEditingController!.text,
        onCodeSubmitted: (code) {
          widget.textEditingController!.text = code.trim();
        },
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onCodeChanged: (code) {
          if (code!.length == widget.verificationCodeLength || code.isEmpty) {
            FocusScope.of(context).requestFocus(FocusNode());
            widget.textEditingController!.text = code.trim();
          }
        },
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.labelText != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: pb0_5,
                    child: MDSSubhead(
                      widget.labelText!,
                    ),
                  ),
                  widget.isCompulsory!
                      ? Padding(
                          padding: pl1 + pt1,
                          child: Container(
                            padding: p1,
                            decoration: BoxDecoration(
                              color: ColorToken.mirch,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      : Container(),
                ],
              )
            : Container(),
        TextFormField(
          onTap: () =>
              widget.textFieldOnTap != null ? widget.textFieldOnTap!() : {},
          keyboardType: widget.isMultiLine!
              ? TextInputType.multiline
              : _textInputType ?? TextInputType.text,
          textInputAction: widget.textInputAction,
          key: widget.textFormFieldKey,
          obscureText: _obscureText,
          maxLines: widget.isMultiLine! ? widget.maxLines : 1,
          minLines: widget.isMultiLine! ? widget.minLines : 1,
          focusNode: _textFieldFocusNode,
          readOnly: widget.isReadOnly!,
          textCapitalization: widget.textCapitalization!,
          enableInteractiveSelection: widget.isInteractiveSelectionEnabled!,
          controller: widget.textEditingController,
          autovalidateMode: _isFirstFocus
              ? AutovalidateMode.disabled
              : AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters ?? _inputFormatters,
          textAlign:
              widget.isMetric! ? TextAlign.center : widget.textAlignment!,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: fontSize16,
            height: fontLineHeight20 / fontSize16,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.backgroundColor ?? ColorToken.white,
            contentPadding: EdgeInsets.only(
              top: spacing3,
              bottom: spacing3,
              left: (widget.prefixIcon != null || widget.isMetric!)
                  ? spacing2
                  : spacing2,
              right: (widget.suffixIcon != null || widget.isMetric!)
                  ? spacing2
                  : spacing2,
            ),
            hintText: widget.placeholderText,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: fontSize16,
              color: inverseLightest,
              height: fontLineHeight20 / fontSize16,
            ),

            prefixIcon: _prefixIcon != null ||
                    widget.prefixText != null ||
                    widget.isMetric!
                ? GestureDetector(
                    onTap: () {
                      if (widget.prefixIconCallback != null) {
                        widget.prefixIconCallback!();
                      } else if (widget.isMetric!) {
                        /// decreasing _metricValue by tapping on - icon
                        FocusScope.of(widget.parentContext!)
                            .requestFocus(FocusNode());
                        _metricValue = (Decimal.parse(_metricValue.toString())                             -Decimal.one
                            ).toDouble();
                        setState(() {
                          widget.textEditingController!.text =
                              _metricValue.toString();
                        });
                      }
                    },
                    child: widget.prefixText != null
                        ? Padding(
                            padding: p3,
                            child: MDSSubhead(
                              widget.prefixText!,
                              appearance: SubheadAppearance.subtle,
                            ),
                          )
                        : Icon(
                            _prefixIcon ?? Icons.remove,
                            color: widget.isMetric!
                                ? ColorToken.black
                                : inverseLightest,
                            size: spacing1_5,
                          ),
                  )
                : null,

            /// bypassing the null check for suffix icon in case of TextInputType
            /// as password field
            suffixIcon: (_suffixIcon != null ||
                        widget.suffixIconWidget != null ||
                        (_textInputType == TextInputType.visiblePassword)) ||
                    widget.suffixText != null ||
                    widget.isMetric!
                ? GestureDetector(
                    onTap: () {
                      /// making text visibility in field on and off when
                      /// user clicks on suffixIcon if textInputType is visiblePassword
                      if (_textInputType == TextInputType.visiblePassword) {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      }

                      if (widget.suffixIconCallback != null) {
                        widget.suffixIconCallback!();
                      }

                      /// increasing _metricValue by tapping on + icon
                      if (widget.isMetric!) {
                        FocusScope.of(widget.parentContext!)
                            .requestFocus(FocusNode());
                        _metricValue = (Decimal.parse(_metricValue.toString()) +
                            Decimal.one).toDouble();
                        setState(() {
                          widget.textEditingController!.text =
                              _metricValue.toString();
                        });
                      }
                    },
                    child: widget.suffixText != null
                        ? Padding(
                            padding: p3,
                            child: MDSSubhead(
                              widget.suffixText!,
                              appearance: SubheadAppearance.subtle,
                            ),
                          )
                        : widget.suffixIconWidget ??
                            Icon(
                              _getSuffixIcon(),
                              color: widget.isMetric!
                                  ? ColorToken.black
                                  : inverseLightest,
                              size: spacing1_5,
                            ),
                  )
                : widget.isClearButtonEnabled != null &&
                        widget.isClearButtonEnabled!
                    ? clearButton()
                    : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spacing2),
              borderSide: BorderSide(
                color: secondary,
                width: spacing0_5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spacing2),
              borderSide: BorderSide(
                color: alert,
                width: spacing0_5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spacing2),
              borderSide: BorderSide(
                color: primary,
                width: spacing0_5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spacing2),
              borderSide: BorderSide(
                color: secondary,
                width: spacing0_5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(spacing2),
              borderSide: BorderSide(
                color: alert,
                width: spacing0_5,
              ),
            ),
          ),
          onChanged: (String value) {
            /// in phone inputType allowing 4 more characters more
            /// for formatting of US phone number then removing focus
            if (_textInputType == TextInputType.phone) {
              if (value.length == widget.numberOfCharactersAllowed! + 4 &&
                  widget.parentContext != null &&
                  widget.isUSPhoneNumber!) {
                /// removing focus when 14(10 numbers + 4 extras) digits is entered
                FocusScope.of(widget.parentContext!).nextFocus();
              } else if (value.length == widget.numberOfCharactersAllowed &&
                  widget.parentContext != null) {
                /// removing focus when 10 numbers is entered
                FocusScope.of(widget.parentContext!).requestFocus(FocusNode());
              }
            } else {
              if (widget.isMetric!) {
                try {
                  double parsedValue =
                      double.parse(widget.textEditingController!.text.trim());
                  setState(() {
                    _metricValue = parsedValue;
                  });
                } catch (e) {
                  print('invalid input');
                }
              }

              /// when numberOfCharactersAllowed equals to length of text entered
              /// then removing focus
              if (value.length == widget.numberOfCharactersAllowed &&
                  widget.parentContext != null) {
                FocusScope.of(widget.parentContext!).requestFocus(FocusNode());
              }
            }

            if (widget.textFieldDidUpdate != null) {
              widget.textFieldDidUpdate!(value);
            }

            if (widget.isClearButtonEnabled!) {
              if (value.isEmpty) {
                setState(() {
                  showClearButton = false;
                });
              } else {
                setState(() {
                  showClearButton = true;
                });
              }
            }
          },
          onFieldSubmitted: (String submittedValue) {
            widget.onFieldSubmitted != null
                ? widget.onFieldSubmitted!(submittedValue)
                : _textFormFieldSubmitted(submittedValue);
          },
          onSaved: widget.onSaved,
        ),
        widget.helperText != null
            ? Padding(
                padding: pt1,
                child: MDSCaption(
                  widget.helperText!,
                  appearance: CaptionAppearance.subtle,
                ),
              )
            : Container(),
      ],
    );
  }

  IconData? _getSuffixIcon() {
    if (_suffixIcon != null) {
      return _suffixIcon;
    } else if (_textInputType == TextInputType.visiblePassword) {
      return _getPasswordIcon();
    }

    return Icons.add;
  }

  /// handles the change in focus
  void _handleTextFieldFocusChange() {
    if (_textFieldFocusNode.hasFocus) {
      /// showing overlay when [MDSInput] comes in focus
      showOverlay();
      if (widget.textFieldFocusCallback != null) {
        widget.textFieldFocusCallback!();
      }
    } else {
      /// hide overlay when [MDSInput] comes out of focus
      removeOverlay();
      if (widget.textFieldUnFocusCallback != null) {
        widget.textFieldUnFocusCallback!();
      }
      if (widget.textFormFieldKey != null &&
          widget.textFormFieldKey!.currentState != null &&
          widget.textFormFieldKey!.currentState!.validate()) {
        widget.textFormFieldKey!.currentState!.save();
      } else {
        /// setting [_isFirstFocus] to false when the user pressed done
        /// or enter first time from keyboard in [MDSInput]
        if (_isFirstFocus && mounted) {
          setState(() {
            _isFirstFocus = false;
          });
        }
      }
    }
  }

  Widget? clearButton() {
    if (showClearButton) {
      return GestureDetector(
        child: Icon(
          Icons.clear,
          color: inverseLightest,
        ),
        onTap: () {
          widget.textEditingController!.clear();
          setState(() {
            showClearButton = false;
          });
          if (widget.textFieldDidUpdate != null) {
            widget.textFieldDidUpdate!('');
          }
          Future.delayed(Duration.zero, () {
            _textFieldFocusNode.unfocus();
          });
        },
      );
    } else {
      return null;
    }
  }

  /// [_textFormFieldSubmitted] is called when done or enter is pressed
  /// on keyboard and later removing focus from [MDSInput]
  void _textFormFieldSubmitted(String submittedValue) {
    if (_textFieldFocusNode.hasFocus) {
      _textFieldFocusNode.unfocus();
    }
  }

  /// showing done button over the keyboard in iOS app
  void showOverlay() {
    if (widget.parentContext != null &&
        !kIsWeb &&
        Platform.isIOS &&
        (_textInputType == TextInputType.number ||
            _textInputType == TextInputType.phone)) {
      if (_overlayEntry != null) {
        return;
      }
      OverlayState overlayState = Overlay.of(widget.parentContext!)!;
      _overlayEntry = OverlayEntry(builder: (context) {
        return Positioned(
          child: _doneButtonWidget(context),
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: noSpacing,
          left: noSpacing,
        );
      });
      overlayState.insert(_overlayEntry!);
    }
  }

  /// removing overlay when focus is removed
  void removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  /// done widget is used in iOS app to dismiss show or dismiss overlay
  /// when TextInput type is number
  Widget _doneButtonWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: py1,
          child: CupertinoButton(
            padding: py2 + pr4,
            child: Text(
              'Done',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: fontSize16,
                color: primary,
              ),
            ),
            onPressed: () {
              _textFieldFocusNode.unfocus();
            },
          ),
        ),
      ),
    );
  }

  /// suffix icon according to the visibility set by user in [MDSInput]
  /// when TextInputType is password
  IconData _getPasswordIcon() {
    if (_obscureText) {
      return Icons.visibility;
    } else {
      return Icons.visibility_off;
    }
  }
}
