import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/routes/app_pages.dart';
import 'app/themes/theme.dart';

Future<void> main() async {
  await GetStorage.init();
  await initializeDateFormatting();
  Supabase.initialize(
    url: 'https://msmadctdbeohiunmlozf.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1zbWFkY3RkYmVvaGl1bm1sb3pmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0MjA1MDUsImV4cCI6MjAyOTk5NjUwNX0.Qu5aoxv1UhAqZfFzTw3G3MhlX-1EeE_xITWw8pwQYxg',
  );
  Intl.defaultLocale = 'id_ID';
  runApp(
    GetMaterialApp(
      title: "Tatarupiah",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.themeData,
    ),
  );
}
