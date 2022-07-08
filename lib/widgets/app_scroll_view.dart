import 'package:flutter/material.dart';

class AppScrollView extends StatelessWidget {
  const AppScrollView({
    required this.children,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/paper_bg.png"),
            repeat: ImageRepeat.repeatY,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children
              .map(
                (child) => Padding(
                  padding: const EdgeInsets.all(16.0).copyWith(bottom: 0.0),
                  child: child,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
