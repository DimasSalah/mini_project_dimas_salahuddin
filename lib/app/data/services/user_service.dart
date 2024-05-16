import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatrupiah_si/app/data/model/user_model.dart';

import '../../constant/key.dart';

class UserService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final idUser = GetStorage().read('id');
  final String baseUrl = 'https://msmadctdbeohiunmlozf.supabase.co/rest/v1/';
  final String apiKey = supabaseKey;

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
      print('salah');
      rethrow;
    }
  }

  Future<void> updateUser(String name, icon) async {
    try {
      final response = await dio.patch(
        '${baseUrl}users?id=eq.$idUser',
        data: [
          {
            'name': name,
            'icon': icon,
          }
        ],
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i(response.data);
      }
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
