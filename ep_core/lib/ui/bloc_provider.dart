import 'package:flutter/material.dart';

typedef BlocBuilder<T> = T Function();
typedef BlocDisposer<T> = Function(T);

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  const BlocProvider({
    Key? key,
    required this.child,
    required this.builder,
    this.disposer,
  }) : super(key: key);

  final Widget child;
  final BlocBuilder<T> builder;
  final BlocDisposer<T>? disposer;

  static T? of<T extends BlocBase>(BuildContext context) {
    var provider = context
        .getElementForInheritedWidgetOfExactType<_BlocProviderInherited<T>>()
        ?.widget as _BlocProviderInherited<T>?;
    return provider?.bloc;
  }

  @override
  State<StatefulWidget> createState() => _BlocProviderState<T>();
}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  late T bloc;

  @override
  void initState() {
    bloc = widget.builder();
    super.initState();
  }

  @override
  void dispose() {
    widget.disposer?.call(bloc);
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  const _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => false;
}
