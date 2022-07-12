import 'package:flutter/material.dart';

class BodySmall extends StatelessWidget {
  const BodySmall(String data, {Key? key})
      : _data = data,
        super(key: key);

  final String _data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _data,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
