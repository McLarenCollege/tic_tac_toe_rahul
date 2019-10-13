import 'package:flutter/material.dart';

class containerSpace extends StatelessWidget {
  final Function onTap;
  final double height;
  final double width;
  final double opacity;
  final Widget child;

  containerSpace(
      {this.onTap,
      this.height = 90,
      this.width = 90,
      this.opacity = .5,
      this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(opacity),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: child,
      ),
    );
  }
}
