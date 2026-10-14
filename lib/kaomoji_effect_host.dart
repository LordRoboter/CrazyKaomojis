import 'package:crazy_kaomojis/effects/no_effect.dart';
import 'package:crazy_kaomojis/kaomoji_definiton.dart';
import 'package:crazy_kaomojis/kaomoji_effect_register.dart';
import 'package:material_ui/material_ui.dart';

class KaomojiEffectHost extends StatelessWidget {
  const KaomojiEffectHost({
    super.key,
    required this.definition,
    required this.onTap,
    this.text,
  });

  final KaomojiDefinition definition;
  final VoidCallback onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final effect = definition.effect;
    debugPrint(effect?.name);

    final builder = effect == null ? null : effectRegistry[effect];

    if (builder == null) {
      return Positioned.fill(
        child: NoEffect(face: definition.face, onKaomojiTap: onTap, text: text),
      );
    }

    return Positioned.fill(
      child: builder(context, definition.face, onTap, text),
    );
  }
}
