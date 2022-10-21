// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final bool topLeft;
  final bool topRight;
  final bool bottomLeft;
  final bool bottomRight;
  final bool all;
  final double radius;
  final Color color;
  final EdgeInsets padding;

  const RoundedContainer({
    Key? key,
    this.width = 100,
    required this.height,
    required this.child,
    this.topLeft = false,
    this.topRight = false,
    this.bottomLeft = false,
    this.bottomRight = false,
    this.color = Colors.white,
    this.radius = 14,
    this.all = false,
    this.padding = const EdgeInsets.all(10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: topLeft || all
              ? Radius.circular(radius)
              : const Radius.circular(0),
          topRight: topRight || all
              ? Radius.circular(radius)
              : const Radius.circular(0),
          bottomLeft: bottomLeft || all
              ? Radius.circular(radius)
              : const Radius.circular(0),
          bottomRight: bottomRight || all
              ? Radius.circular(radius)
              : const Radius.circular(0),
        ),
      ),
      child: child,
    );
  }
}
