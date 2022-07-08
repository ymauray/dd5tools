import 'package:flutter/material.dart';

class Collapsible extends StatefulWidget {
  const Collapsible({
    required title,
    required List<Widget> children,
    bool badge = false,
    Key? key,
  })  : _title = title,
        _children = children,
        _badge = badge,
        super(key: key);

  final String _title;
  final List<Widget> _children;
  final bool _badge;

  @override
  State<Collapsible> createState() => _CollapsibleState();
}

class _CollapsibleState extends State<Collapsible> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget._title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                    ],
                  ),
                ),
                if (_isExpanded)
                  Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(
                      top: 0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget._children,
                    ),
                  ),
              ],
            ),
          ),
          if (widget._badge)
            const Positioned(
              top: -12,
              left: -12,
              child: Icon(
                Icons.circle_rounded,
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }
}
