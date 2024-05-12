import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class TotalBalanceService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final String baseUrl = 'https://msmadctdbeohiunmlozf.supabase.co';
  final String userId = GetStorage().read('id');
  final String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1zbWFkY3RkYmVvaGl1bm1sb3pmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ0MjA1MDUsImV4cCI6MjAyOTk5NjUwNX0.Qu5aoxv1UhAqZfFzTw3G3MhlX-1EeE_xITWw8pwQYxg';

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
