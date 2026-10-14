import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoEffect extends StatelessWidget {
  const NoEffect({
    super.key,
    required this.face,
    required this.onKaomojiTap,
    this.text,
  });
  final String face;
  final String? text;
  final VoidCallback onKaomojiTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onKaomojiTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              face,
              style: Theme.of(context).textTheme.headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),

            const SizedBox(height: 12),
            if (text != null && text!.isNotEmpty) ...[
              Text(
                text!,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
