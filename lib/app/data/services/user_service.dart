import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatrupiah_si/app/data/model/user_model.dart';

class UserService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final idUser = GetStorage().read('id');
  final String baseUrl = 'https://msmadctdbeohiunmlozf.supabase.co/rest/v1/';
  final String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1zbWFkY3RkYmVvaGl1bm1sb3pmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0MjA1MDUsImV4cCI6MjAyOTk5NjUwNX0.Qu5aoxv1UhAqZfFzTw3G3MhlX-1EeE_xITWw8pwQYxg';
  

  Future<UserModel> getUser() async {
    try {
      final response = await dio.get(
        '${baseUrl}users?id=eq.$idUser',
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );
      if (response.statusCode == 200 && response.data.isNotEmpty) {
        logger.i(response.data[0]);
      }
      return UserModel.fromJson(response.data[0]);
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
