import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/utilites/helpers/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilites/constants/constants.dart';

enum _DecorationType { focused, error, enabled, disabled, validated }

//TODO HOW TO GET CURRENT STATE OF TEXT FORM FIELD RO TOGGLE SUFFIX ICON BASED ON IT
// enum _SuffixType { validate(), notValidate, showPassword, hidePassword }

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? autoFocus,
      enabled,
      expands,
      ignorePointer,
      obscureText,
      isReadOnly;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function()? onTap, onSuffixTap;
  final void Function(String?)? onSaved, onChanged, onFieldSubmitted;
  final void Function()? onEditingComplete;
  final int? maxLines, minLines;
  final TextDirection? textDirection;
  final TextInputType? textInputType;
  final String? lableText, hintText;
  final Widget? suffix, prefix;
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    this.focusNode,
    this.autoFocus = false,
    this.enabled = true,
    this.validator,
    this.textInputAction,
    this.textDirection,
    this.onTap,
    this.onSaved,
    this.maxLines,
    this.onEditingComplete,
    this.onChanged,
    this.onFieldSubmitted,
    this.expands,
    this.ignorePointer,
    this.textInputType,
    this.minLines,
    this.obscureText = false,
    this.hintText,
    this.lableText,
    this.prefix,
    this.suffix,
    this.isReadOnly,
    this.onSuffixTap,
  });

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  OutlineInputBorder getInputDecoration({required _DecorationType type}) {
    switch (type) {
      case _DecorationType.focused:
        return OutlineInputBorder(
            borderRadius: Constants.kBorderRadius16,
            borderSide: const BorderSide(
                // color: ThemeHelper.of(context).textColorMain,
                width: 1.5
            )
        );
      case _DecorationType.error:
        return OutlineInputBorder(
            borderRadius: Constants.kBorderRadius16,
            borderSide: const BorderSide(
              // color: ThemeHelper.of(context).cancel,
            ));
      case _DecorationType.enabled:
        return OutlineInputBorder(
            borderRadius: Constants.kBorderRadius16,
            borderSide: const BorderSide(
              // color: ThemeHelper.of(context).medGrey,
            ));
      case _DecorationType.disabled:
        return OutlineInputBorder(
            borderRadius: Constants.kBorderRadius16,
            borderSide: const BorderSide(
              // color: ThemeHelper.of(context).medGrey,
            ));
      case _DecorationType.validated:
        return OutlineInputBorder(
            borderRadius: Constants.kBorderRadius16,
            borderSide: const BorderSide(
              // color: ThemeHelper.of(context).success,
            ));
    }
  }

  Color getHintColor({_DecorationType? type}) {
    //NOT WORKING
    switch (type) {
      case _DecorationType.error:
        // return ThemeHelper.of(context).cancel;
        return Colors.red;
      case _DecorationType.focused:
      case _DecorationType.validated:
      case _DecorationType.enabled:
        return Colors.blueGrey;
        // return ThemeHelper.of(context).textColorMain;
      case _DecorationType.disabled:
        return Colors.blueGrey;

    // return ThemeHelper.of(context).textColorSecondary;
      case null:
        return Colors.blueGrey;

    // return ThemeHelper.of(context).textColorMain;
    }
  }

  bool get isValidate =>
      widget.validator != null && widget.controller.text.isNotEmpty;

  InputDecoration get getDecoration => InputDecoration(
        labelStyle: TextStyleHelper.of(context).bodyLarge16,
        enabled: widget.enabled ?? true,
        hintText: widget.hintText ?? "",
        labelText: widget.lableText ?? "",
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: GestureDetector(
              onTap: widget.onSuffixTap,
              child: widget.suffix ?? const SizedBox()),
        ),
        prefixIconConstraints: const BoxConstraints(
            maxHeight: 32, maxWidth: 32, minHeight: 32, minWidth: 32),
        suffixIconConstraints: const BoxConstraints(
            maxHeight: 32, maxWidth: 48, minHeight: 32, minWidth: 32),
        border: getInputDecoration(type: _DecorationType.enabled),
        enabledBorder: getInputDecoration(type: _DecorationType.enabled),
        errorBorder: getInputDecoration(
          type: _DecorationType.error,
        ),
        focusedBorder: getInputDecoration(type: _DecorationType.focused),
        disabledBorder: getInputDecoration(type: _DecorationType.disabled),
      );
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        autofocus: widget.autoFocus ?? false,
        decoration: getDecoration,
        enabled: widget.enabled ?? true,
        validator: widget.validator,
        textInputAction: widget.textInputAction,
        // textDirection: isArabic(context) ? TextDirection.rtl : TextDirection.ltr,
        textDirection:  TextDirection.rtl ,
        textAlignVertical: TextAlignVertical.center,
        showCursor: true,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        style: TextStyleHelper.of(context).bodyLarge16,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        // cursorHeight: 2,
        onTap: widget.onTap,
        restorationId: "--",
        onSaved: widget.onSaved,
        autocorrect: true,
        onFieldSubmitted: widget.onFieldSubmitted ?? widget.onSaved,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        cursorWidth: 2.5.w,
        canRequestFocus: true,
        textAlign: TextAlign.start,
        // obscuringCharacter: ".",
        readOnly: widget.isReadOnly ?? false,
        clipBehavior: Clip.antiAlias,
        // cursorColor: ThemeHelper.of(context).textColorMain.withOpacity(0.6),
        cursorRadius: const Radius.circular(4),
        // cursorErrorColor: ThemeHelper.of(context).cancel,
        enableSuggestions: widget.enabled != null ? true : false,
        enableInteractiveSelection: true,
        expands: widget.expands ?? false,

        // initialValue:,
        // ignorePointers: widget.ignorePointer,
        // cursorHeight: ,
        // undoController: ,
        onTapAlwaysCalled: false,
        // contentInsertionConfiguration: (context)=,
        keyboardType: widget.textInputType,
        maxLengthEnforcement: MaxLengthEnforcement.none,
        obscureText: widget.obscureText ?? false,
        minLines: widget.minLines ?? 1,
        maxLines: widget.maxLines ?? 1,

      ),
    );
  }
}
