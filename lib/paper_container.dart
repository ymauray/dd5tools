import 'package:flutter/material.dart';

class PaperContainer extends StatelessWidget {
  const PaperContainer({
    required child,
    bool fullwidth = true,
    Key? key,
  })  : _child = child,
        _fullwidth = fullwidth,
        super(key: key);

  final Widget _child;
  final bool _fullwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _fullwidth ? MediaQuery.of(context).size.width : null,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/paper_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: _child,
    );
  }
}
