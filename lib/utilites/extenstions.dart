import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  SliverToBoxAdapter get toSliver =>SliverToBoxAdapter(child: this,);
  SliverFillRemaining get toExpandedSliver =>SliverFillRemaining(child: this,);
    SizedBox widthBox(double width) => SizedBox(width: width, child: this);
  SizedBox heightBox(double height) => SizedBox(height: height , child: this);

  Center get center => Center(child: this);
  Widget centerWhen(bool cond) => cond ? Center(child: this) : this;
  Expanded get expand => Expanded(child: this);
  Expanded expandFlex({required int flex}) => Expanded(flex: flex, child: this);
  FittedBox get fit => FittedBox(child: this);
  Padding addPaddingVertical({required double padding}) => Padding(padding: EdgeInsetsDirectional.symmetric(vertical: padding), child: this);
  ScrollConfiguration get withVerticalScroll => ScrollConfiguration(
    behavior: const ScrollBehavior().copyWith(
      overscroll: true,
      scrollbars: false,
      physics: const BouncingScrollPhysics(),
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: this,
    ),
  );
  Widget withVerticalScrollWhen(bool cond) => cond
      ? ScrollConfiguration(
    behavior: const ScrollBehavior().copyWith(
      overscroll: true,
      scrollbars: false,
      physics: const BouncingScrollPhysics(),
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: this,
    ),
  )
      : this;

  Padding addPaddingAll({required double padding}) => Padding(padding: EdgeInsetsDirectional.all(padding), child: this);
  Padding addPaddingHorizontal({required double padding}) => Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: padding), child: this);
  // ClipRRect roundedEdges({BorderRadius? borderRadius}) => ClipRRect(
  //   borderRadius: borderRadius ?? Constants.kBorderRadius16,
  //   child: this,
  // );
}

extension DoubleExtension on double {
  Widget get widthBox => SizedBox(width: this);
  Widget get heightBox => SizedBox(height: this);
}
