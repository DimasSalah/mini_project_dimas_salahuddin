import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:logger/logger.dart';

class ImageService extends GetxService {
  final dio = Dio();
  final logger = Logger();
  
  Future<Response> imageUrl(String name) async {
    try {
      Response response = await dio.get('https://api.dicebear.com/8.x/notionists/svg?seed=$name');
      if (response.statusCode == 200) {
        logger.i('Success get svg image');
        return response;
      } else {
        throw Exception('Failed to load image');
      }
    } catch (error) {
      throw Exception('Failed to load image: $error');
    }
  }
}