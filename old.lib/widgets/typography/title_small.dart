import 'package:flutter/material.dart';

class TitleSmall extends StatelessWidget {
  const TitleSmall(String data, {EdgeInsets? padding, Key? key})
      : _data = data,
        _padding = padding ?? EdgeInsets.zero,
        super(key: key);

  final String _data;
  final EdgeInsets _padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _data,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Divider(
            color: Color(0xffc9ad6a),
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
