import 'package:example/inherited.dart';
import 'package:example/some_widget.dart';
import 'package:flat_tree/flat_tree.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: FlatTree(
          passContext: true,
          children: <BuildFunction>[
            (_, Widget child) => SomeWidget(title: 'Start', child: child),
            (_, Widget child) => Inherited(text: 'a', child: child),
            (_, Widget child) => SomeWidget(title: '1', child: child),
            (_, Widget child) => SomeWidget(title: '2', child: child),
            (_, Widget child) => Inherited(text: 'b', child: child),
            (_, Widget child) => SomeWidget(title: '3', child: child),
            (_, Widget child) => SomeWidget(title: '4', child: child),
            (_, Widget child) => SomeWidget(title: '5', child: child),
            (_, Widget child) => SomeWidget(title: '6', child: child),
            (_, Widget child) => Inherited(text: 'd', child: child),
            (_, Widget child) => SomeWidget(title: '7', child: child),
            (_, Widget child) => Inherited(text: 'c', child: child),
            _buildSomeWidgetUsingContext,
          ],
          child: const SomeWidget(
            title: 'End',
            child: Text('🙂'),
          ),
        ),
      ),
    );
  }

  Widget _buildSomeWidgetUsingContext(BuildContext context, Widget child) {
    final String inherited = Inherited.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('8 / $inherited'),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}
