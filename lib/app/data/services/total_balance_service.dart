import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../../constant/key.dart';

class TotalBalanceService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final String baseUrl = 'https://msmadctdbeohiunmlozf.supabase.co';
  final String userId = GetStorage().read('id');
  final String apiKey = supabaseKey;

  Future<Response> getTotalBalance(String startDate, String endDate ) async {
    try {
      final response = await dio.post(
        '$baseUrl/rest/v1/rpc/total_balance_by_month',
        data: {
          'id_user': userId,
          "start_date": startDate,
          "end_date": endDate,
        },
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i('Berhasil mendapatkan total balance');
        return response;
      }
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
