import 'package:flutter/material.dart';

class Transition extends PageRouteBuilder {
  Transition.first(Widget page)
      : super(
            transitionDuration: Duration(milliseconds: 500),
            reverseTransitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (context, fAnimation, sAnimation, widget) {
              return Opacity(
                opacity: fAnimation.isCompleted ? 1 : 0,
                child: ScaleTransition(
                  alignment: Alignment.center,
                  scale: fAnimation,
                  child: widget,
                ),
              );
            },
            pageBuilder: (context, fAnimation, sAnimation) {
              return page;
            });
}
