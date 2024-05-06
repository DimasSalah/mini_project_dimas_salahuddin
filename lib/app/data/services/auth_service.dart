import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:get/route_manager.dart';
import 'package:tatrupiah_si/app/data/services/image_service.dart';
import 'package:tatrupiah_si/app/routes/app_pages.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';

class AuthService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final idUser = GetStorage().read('id');
  final String baseUrl = 'https://msmadctdbeohiunmlozf.supabase.co/rest/v1/';
  final String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1zbWFkY3RkYmVvaGl1bm1sb3pmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0MjA1MDUsImV4cCI6MjAyOTk5NjUwNX0.Qu5aoxv1UhAqZfFzTw3G3MhlX-1EeE_xITWw8pwQYxg';

  Future<Response> register(String id,String name, String icon) async {
    try {
      final response = await dio.post(
        '${baseUrl}users',
        data: {
          'id' : id,
          'name': name,
          'icon': icon,
        },
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );
      if (response.statusCode == 201) {
        logger.i('Berhasil membuat user');
        GetStorage().write('id', id);
        Get.offAllNamed(Routes.HOME);
        return response;
      }
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Response> login(String name, String password) async {
    try {
      final response = await dio.get(
        '${baseUrl}users?name=eq.$name&password=eq.$password',
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );
      if (response.statusCode == 200 && response.data.isNotEmpty) {
        Get.offAllNamed(Routes.HOME);
        int id = response.data[0]['id'];
        GetStorage().write('id', id);
        logger.i(response.data[0]);
        return response;
      } else {
        logger.e('Login failed');
        return response;
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
