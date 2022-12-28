import 'package:flutter/material.dart';

class TitleMedium extends StatelessWidget {
  const TitleMedium(String data, {EdgeInsets? padding, Key? key})
      : _data = data,
        _padding = padding ?? EdgeInsets.zero,
        super(key: key);

  final String _data;
  final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: _padding,
          child: Text(
            _data,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
