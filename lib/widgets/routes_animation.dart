import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Routes_animation extends PageRouteBuilder {
  final Widget widget;
  final Alignment alignment;

  Routes_animation({this.widget, this.alignment})
      : super(
            transitionDuration: Duration(milliseconds: 300),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);
              return ScaleTransition(
                scale: animation,
                alignment: alignment,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return widget;
            });
}
