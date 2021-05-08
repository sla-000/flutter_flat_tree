import 'package:flutter/widgets.dart';

/// Builder function
typedef BuildFunction = Widget Function(BuildContext context, Widget child);

/// Widget for representing widget tree as simple short list
class FlatTree extends StatelessWidget {
  const FlatTree({
    Key? key,
    required this.children,
    this.passContext = false,
    this.child,
  }) : super(key: key);

  /// List of children in tree
  final List<BuildFunction> children;

  /// Last child
  final Widget? child;

  /// Pass context using Builder widget
  ///
  /// Increases widget tree depth so disabled by default
  final bool passContext;

  @override
  Widget build(BuildContext context) {
    return _getWidget(context, 0);
  }

  Widget _getWidget(BuildContext context, int index) {
    if (index >= children.length) {
      return child ?? const SizedBox.shrink();
    }

    return children[index].call(
      context,
      passContext
          ? Builder(
              builder: (BuildContext context) => _getWidget(context, ++index),
            )
          : _getWidget(context, ++index),
    );
  }
}
