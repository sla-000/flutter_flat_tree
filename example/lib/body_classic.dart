import 'package:example/inherited.dart';
import 'package:example/some_widget.dart';
import 'package:flutter/material.dart';

class BodyClassic extends StatelessWidget {
  const BodyClassic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SomeWidget(
          title: 'Start',
          child: Inherited(
            text: 'a',
            child: SomeWidget(
              title: '1',
              child: SomeWidget(
                title: '2',
                child: Inherited(
                  text: 'b',
                  child: SomeWidget(
                    title: '3',
                    child: SomeWidget(
                      title: '4',
                      child: SomeWidget(
                        title: '5',
                        child: SomeWidget(
                          title: '6',
                          child: Inherited(
                            text: 'd',
                            child: SomeWidget(
                              title: '7',
                              child: Inherited(
                                text: 'c',
                                child: Builder(
                                  builder: (BuildContext context) {
                                    final String inherited =
                                        Inherited.of(context);

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text('8 / $inherited'),
                                        const SizedBox(height: 16),
                                        const SomeWidget(
                                          title: 'End',
                                          child: Text('🙂'),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
