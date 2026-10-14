import 'package:crazy_kaomojis/effects/dance_effect.dart';
import 'package:crazy_kaomojis/effects/no_effect.dart';
import 'package:crazy_kaomojis/effects/rain_effect.dart';
import 'package:crazy_kaomojis/kaomoji_definiton.dart';
import 'package:material_ui/material_ui.dart';

typedef KaomojiEffectBuilder = Widget Function(
  BuildContext context,
  String face,
  VoidCallback onKaomojiTap,
  String? text,
);

final Map<KaomojiEffect, KaomojiEffectBuilder> effectRegistry = {
  KaomojiEffect.noEffect: (context, face, onKaomojiTap, text) =>
      NoEffect(face: face, onKaomojiTap: onKaomojiTap, text: text),

  KaomojiEffect.dance: (context, face, onKaomojiTap, text) =>
      DanceEffect(face: face, onKaomojiTap: onKaomojiTap, text: text),

  KaomojiEffect.rain: (context, face, onKaomojiTap, text) =>
      RainEffect(face: face, onKaomojiTap: onKaomojiTap, text: text),
};
