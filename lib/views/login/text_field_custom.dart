

import 'package:flutter/material.dart';
import 'package:vouch_chatroom/utils/helpers.dart';

class TextFieldCustom extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;

  const TextFieldCustom({
    Key? key,
    required this.child,
    this.padding,
    this.borderRadius
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helpers.getWidthPageSize(context),
      padding: padding ?? EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: Border.all(color: Color(0xffE8E8E8))
      ),
      child: child,
    );
  }
}
