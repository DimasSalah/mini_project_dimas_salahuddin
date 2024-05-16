import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:get/route_manager.dart';
import 'package:tatrupiah_si/app/routes/app_pages.dart';
import 'package:tatrupiah_si/app/themes/colors.dart';

import '../../constant/key.dart';

class AuthService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final String baseUrl = 'https://msmadctdbeohiunmlozf.supabase.co';
  final String apiKey = supabaseKey;

  Future<Response> registerUser(String userId,String name, String icon) async {
    try {
      final response = await dio.post(
        '$baseUrl/rest/v1/users',
        data: {
          'id' : userId,
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
        return response;
      }
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Response> registerAuth(String email, String password) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/v1/signup',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 && response.data.isNotEmpty) {
        logger.i('Berhasil membuat akun');
          Get.snackbar(
            'Succes',
            'Berhasil membuat user',
            backgroundColor: light.withOpacity(0.5),
            colorText: success,
          );
        return response;
      }
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<Response> loginAuth(String email, String password) async {
    try {
      final response = await dio.post(
        '$baseUrl/auth/v1/token?grant_type=password',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 && response.data.isNotEmpty) {
        String id = response.data['user']['id'];
        GetStorage().write('id', id);
        logger.i(response.data['user']['id']);
         Get.offAllNamed(Routes.MAIN);
        return response;
      } else {
        logger.e('Login failed');
        return response;
      }
    } catch (e) {
      logger.e(e);
      Get.snackbar('error', 'Email atau password salah',colorText: error,backgroundColor: light.withOpacity(0.5));
      rethrow;
    }
  }
}
