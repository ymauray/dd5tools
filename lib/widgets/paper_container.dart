import 'package:flutter/material.dart';

class PaperContainer extends StatelessWidget {
  const PaperContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/paper_bg.png"),
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: child,
    );
  }
}
