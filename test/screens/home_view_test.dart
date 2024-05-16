import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatrupiah_si/app/modules/home/views/home_view.dart';

void main() {
  testWidgets('HomeView should display title, balance card, and bottom section',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const GetMaterialApp(
        home: HomeView(),
      ),
    );
    expect(find.byKey(const Key('title')), findsOneWidget);
    expect(find.byKey(const Key('balanceCard')), findsNWidgets(2));
    expect(find.byKey(const Key('bottomSection')), findsOneWidget);
    await tester.pump();
  });
}
