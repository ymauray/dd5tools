import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required String label, VoidCallback? onPressed, Key? key})
      : _label = label,
        _onPressed = onPressed,
        super(key: key);

  final String _label;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.red.shade900,
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: ElevatedButton(
            onPressed: _onPressed,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _label,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
