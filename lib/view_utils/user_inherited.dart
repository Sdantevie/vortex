import 'package:flutter/material.dart';
import 'package:vortex/models/user_provider.dart';

class InheritedUser extends InheritedWidget {
  final UserProvider provider;
  InheritedUser({Key key, this.child, this.provider})
      : super(key: key, child: child);

  final Widget child;

  static InheritedUser of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedUser>();
  }

  @override
  bool updateShouldNotify(InheritedUser oldWidget) {
    return true;
  }
}
