import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim/utilites/extenstions.dart';
import 'package:muslim/utilites/helpers/theme_helper.dart';

/// single radio value
class CustomRadioWidget<T> extends StatefulWidget {
  final bool isButton;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;
  final String? title;
  const CustomRadioWidget(
      {super.key,
      required this.value,
      required this.groupValue,
      this.onChanged,
      this.title,
      this.isButton = false});

  @override
  State<CustomRadioWidget> createState() => _CustomRadioWidgetState();
}

class _CustomRadioWidgetState<T> extends State<CustomRadioWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform.scale(
          scale: 1.15,
          child: Radio<T>(
            splashRadius: widget.isButton ? 0 : null,
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
          ),
        ),
        Text(
          widget.title ?? "",
          style: TextStyleHelper.bodyMedium14,
        ),
      ],
    ).widthBox(160.w);
  }
}

///============================[multi_radio_Widget]===============================//
/// what this widget need
/// 1- a list<T> that will be mapped into a a list of radio
/// 2- group value of sigle item will be e ,and group value of them will be changable value
/// 3-onchange of with make group value = value
/// 4-it needs a fixed width
/// 5- it need to be responsive ]
enum RadioListType { row, colun, wrap }

class CustomListRadioWidget<T> extends StatefulWidget {
  final bool isButton;
  final RadioListType _listType;
  final List<T> itemsList;
  final T? groupValue;
  final void Function(T?)? onChanged;

  const CustomListRadioWidget.column({
    super.key,
    required this.itemsList,
    required this.groupValue,
    required this.onChanged,
    this.isButton = false,
  }) : _listType = RadioListType.colun;
  const CustomListRadioWidget.row({
    super.key,
    required this.itemsList,
    required this.groupValue,
    required this.onChanged,
    this.isButton = false,
  }) : _listType = RadioListType.row;
  const CustomListRadioWidget.wrap({
    super.key,
    required this.itemsList,
    required this.groupValue,
    required this.onChanged,
    this.isButton = false,
  }) : _listType = RadioListType.wrap;

  @override
  State<CustomListRadioWidget<T>> createState() =>
      _CustomListRadioWidgetState<T>();
}

class _CustomListRadioWidgetState<T> extends State<CustomListRadioWidget<T>> {
  void _onChanged(T? value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  get mapItemsList => widget.itemsList
      .map(
        (T e) => widget.isButton
            ? MaterialButton(
                shape: const BeveledRectangleBorder(),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _onChanged(e);
                  });
                },
                elevation: e == widget.groupValue ? 6 : 0.5,
                child: CustomRadioWidget<T>(
                  isButton: widget.isButton,
                  title: (e as Enum).name,
                  value: e,
                  groupValue: widget.groupValue,
                  onChanged: _onChanged,
                ).addPaddingAll(padding: 8),
              )
            : CustomRadioWidget<T>(
                title: (e as Enum).name,
                value: e,
                groupValue: widget.groupValue,
                onChanged: _onChanged,
              ).addPaddingAll(padding: 8),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    switch (widget._listType) {
      case RadioListType.wrap:
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: mapItemsList,
        );
      case RadioListType.colun:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: mapItemsList,
        );
      case RadioListType.row:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: mapItemsList,
        );
    }
  }
}
