import 'package:flutter/material.dart';

class TextScalingFactor {
  final double scaleFactor;

  const TextScalingFactor({
    this.scaleFactor = 1.0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    TextScalingFactor? otherModel;
    if (other is TextScalingFactor) {
      otherModel = other;
    }
    return otherModel?.scaleFactor == scaleFactor;
  }

  @override
  int get hashCode => scaleFactor.hashCode;
}

class _ScalingFactorBindingScope<T> extends InheritedWidget {
  const _ScalingFactorBindingScope({
    Key? key,
    required this.scalingFactorBindingState,
    required Widget child,
  })  : super(key: key, child: child);

  final _TextScalerState<T> scalingFactorBindingState;

  @override
  bool updateShouldNotify(_ScalingFactorBindingScope old) {
    return true;
  }
}

class TextScaler<T> extends StatefulWidget {
  TextScaler({
    Key? key,
    required this.initialScaleFactor,
    required this.child,
  })  : assert(initialScaleFactor != null),
        super(key: key);

  final T initialScaleFactor;
  final Widget child;
  @override
  _TextScalerState<T> createState() => _TextScalerState<T>();

  static T of<T>(BuildContext context) {
    final _ScalingFactorBindingScope<T> scope = context.dependOnInheritedWidgetOfExactType<_ScalingFactorBindingScope<T>>()!;
    return scope.scalingFactorBindingState.currentValue;
  }

  static void update<T>(BuildContext context, T newModel) {
    final _ScalingFactorBindingScope<dynamic> scope = context.dependOnInheritedWidgetOfExactType<_ScalingFactorBindingScope<T>>()!;
    scope.scalingFactorBindingState.updateModel(newModel);
  }
}

class _TextScalerState<T> extends State<TextScaler<T>> {
  late T currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialScaleFactor;
  }

  void updateModel(T newModel) {
    if (newModel != currentValue) {
      setState(() {
        currentValue = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _ScalingFactorBindingScope<T>(
      scalingFactorBindingState: this,
      child: widget.child,
    );
  }
}
