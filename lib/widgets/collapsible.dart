import 'package:flutter/material.dart';

typedef CollapsibleBuilder = Widget Function(
  BuildContext context,
);

class Collapsible extends StatefulWidget {
  Collapsible({
    required title,
    required CollapsibleBuilder builder,
    Key? key,
  })  : _title = title,
        _builder = builder,
        super(key: key) {
    debugPrint("Hello there !");
  }

  final String _title;
  final CollapsibleBuilder _builder;
  bool _isExpanded = false;

  @override
  State<Collapsible> createState() => _CollapsibleState();
}

class _CollapsibleState extends State<Collapsible> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        widget._isExpanded = !widget._isExpanded;
      }),
      child: Card(
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
                  Icon(
                    widget._isExpanded ? Icons.expand_less : Icons.expand_more,
                  ),
                ],
              ),
            ),
            if (widget._isExpanded)
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(
                  top: 0,
                ),
                child: widget._builder(context),
              ),
          ],
        ),
      ),
    );
  }
}
