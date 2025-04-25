import 'package:flutter/material.dart';

class InkWellManager {
  const InkWellManager(this.child, this.callback, {this.color});

  final void Function()? callback;
  final Color? color;
  final Widget child;

  InkWell onTap() => InkWell(
    onTap: callback,
    splashColor: color,
    hoverColor: color,
    focusColor: color,
    child: child,
  );

  InkWell onDoubleTap() => InkWell(
    onDoubleTap: callback,
    splashColor: color,
    hoverColor: color,
    focusColor: color,
    child: child,
  );

  InkWell onLongPress() => InkWell(
    onLongPress: callback,
    splashColor: color,
    hoverColor: color,
    focusColor: color,
    child: child,
  );
}
