import 'package:flutter/material.dart';

class TitleLarge extends StatelessWidget {
  const TitleLarge(
    this.label, {
    Key? key,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleLarge),
        const Divider(
          color: Colors.red,
          thickness: 1,
        ),
      ],
    );
  }
}
