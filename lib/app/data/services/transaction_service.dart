
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tatrupiah_si/app/data/model/transaction_model.dart';

import '../../constant/key.dart';

class TransactionService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  final idUser = GetStorage().read('id');
  final String baseUrl = 'https://msmadctdbeohiunmlozf.supabase.co/rest/v1/';
  final String apiKey = supabaseKey;

  Future<Response> postTransaction(String type, int income, int expanse,
      String iconPath, String category, String note, String createdAt) async {
    try {
      final response = await dio.post(
        '${baseUrl}transactions',
        data: {
          'user_id': idUser,
          'type': type,
          'income': income,
          'expanse': expanse,
          'icon_path': iconPath,
          'category': category,
          'note': note,
          'created_at': createdAt,
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
        logger.i(response.data[0]);
        return response;
      }
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  Future<List<TransactionModel>> getTransactions(String firstTimeDate,lastTimeDate) async {
    try {
      final response = await dio.get(
        '${baseUrl}transactions?user_id=eq.$idUser&created_at=gte.$firstTimeDate&created_at=lt.$lastTimeDate',
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );
      if (response.statusCode == 200) {
        logger.i('Success get transactions');
        final data = response.data;
        return List<TransactionModel>.from(data.map((x) => TransactionModel.fromJson(x)));
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      if (e is DioException) {
        logger.e(e.response!.data);
      }
      throw Exception(e);
    } 
  }

  Future<Response> deleteTransaction(int id) async {
    try {
      final response = await dio.delete(
        '${baseUrl}transactions?id=eq.$id',
        options: Options(
          headers: {
            'apikey': apiKey,
            'Content-Type': 'application/json',
            'Prefer': 'return=representation',
          },
        ),
      );
      if (response.statusCode == 204) {
        logger.i('Success delete transaction');
        return response;
      }
      return response;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
