import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:crazy_kaomojis/crazy_kaomoji_page.dart';
import 'package:crazy_kaomojis/kaomoji_definiton.dart';

void main() {
  testWidgets('renders a kaomoji and changes it on tap', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: SizedBox(width: 300, height: 300, child: CrazyKaomojiPage()),
      ),
    );

    // Initial kaomoji should be rendered.
    final initialFace = kaomojis[Kaomoji.worried]!.face;
    expect(find.text(initialFace), findsOneWidget);

    // Tap the displayed kaomoji.
    await tester.tap(find.text(initialFace));
    await tester.pump();

    // The kaomoji should change to a different available face.
    expect(find.text(initialFace), findsNothing);
  });
}
