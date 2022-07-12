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
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/paper_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
