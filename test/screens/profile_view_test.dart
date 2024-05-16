import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tatrupiah_si/app/modules/profile/views/profile_view.dart';

void main() {
  testWidgets('ProfileView displays correct elements', (WidgetTester tester) async {

    await tester.pumpWidget(
      const GetMaterialApp(
        home: ProfileView(),
      ),
    );
    expect(find.byKey(const Key('appBar')), findsOneWidget);
    expect(find.byKey(const Key('profileCard')), findsOneWidget);
    expect(find.byKey(const Key('form')), findsOneWidget);
  });
}
