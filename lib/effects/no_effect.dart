import 'package:flutter/material.dart';

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
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onKaomojiTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              face,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: colors.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            if (text != null && text!.isNotEmpty)
              Text(
                text!,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colors.onSurface,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
