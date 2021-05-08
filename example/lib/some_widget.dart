import 'package:example/inherited.dart';
import 'package:flutter/material.dart';

class SomeWidget extends StatelessWidget {
  const SomeWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final String inherited = Inherited.of(context);

    return Material(
      elevation: 4,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('onTap: title=$title'),
              backgroundColor: Theme.of(context).primaryColorDark,
              duration: const Duration(milliseconds: 300),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text('$title / $inherited'),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
