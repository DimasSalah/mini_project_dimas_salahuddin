import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatrupiah_si/app/modules/ai/views/ai_view.dart';

void main() {
  testWidgets('AiView should display title, description, and button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const GetMaterialApp(
        home: AiView(),
      ),
    );

    expect(find.byKey(const Key('title')), findsOneWidget);
    expect(find.byKey(const Key('description')), findsOneWidget);
    expect(find.byKey(const Key('button')), findsOneWidget);
    expect(find.byKey(const Key('text_button')), findsOneWidget);
    await tester.pump();
  });
}
