import 'package:flutter/material.dart';

class CustomStateLessWidget extends StatelessWidget {
  String text;

  CustomStateLessWidget({Key? key, this.text = 'default'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
