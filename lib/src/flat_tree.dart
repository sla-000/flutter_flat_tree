import 'package:flutter/widgets.dart';

typedef BuildFunction = Widget Function(BuildContext context, Widget child);

class FlatTree extends StatelessWidget {
  const FlatTree({
    Key? key,
    required this.children,
    this.passContext = false,
    this.child,
  }) : super(key: key);

  final List<BuildFunction> children;
  final Widget? child;
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
