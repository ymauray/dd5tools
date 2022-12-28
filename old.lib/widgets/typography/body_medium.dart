import 'package:flutter/material.dart';

class BodyMedium extends StatelessWidget {
  const BodyMedium(String data, {Key? key})
      : _data = data,
        super(key: key);

  final String _data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _data,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}