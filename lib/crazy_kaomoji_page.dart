import 'package:crazy_kaomojis/kaomoji_definiton.dart';
import 'package:crazy_kaomojis/kaomoji_effect_host.dart';
import 'package:material_ui/material_ui.dart';

class CrazyKaomojiPage extends StatefulWidget {
  const CrazyKaomojiPage({super.key, this.text, this.theme});

  final String? text;
  final ThemeData? theme;

  @override
  State<CrazyKaomojiPage> createState() => _CrazyKaomojiPageState();
}

class _CrazyKaomojiPageState extends State<CrazyKaomojiPage> {
  Kaomoji _kaomoji = Kaomoji.worried;

  void _onKaomojiTap() {
    final options = Kaomoji.values
        .where((k) => k != _kaomoji && kaomojis.containsKey(k))
        .toList();

    if (options.isEmpty) return;

    options.shuffle();

    setState(() {
      _kaomoji = options.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    final definition = kaomojis[_kaomoji]!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: double.infinity,
          height: constraints.hasBoundedHeight ? constraints.maxHeight : null,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Theme(
                data: widget.theme ?? Theme.of(context),
                child: KaomojiEffectHost(
                  key: ValueKey(_kaomoji),
                  definition: definition,
                  text: widget.text,
                  onTap: _onKaomojiTap,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
