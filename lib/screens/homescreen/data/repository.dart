import 'dart:developer';

import 'package:dimplom/api/dio_generator.dart';
import 'package:dimplom/screens/homescreen/data/model.dart';

class Repository {
  final DioSettings dio;
  Repository({
    required this.dio,
  });

  Future<List<HomeModelTopics>> getData() async {
    try {
      final response = await dio.dio.get('topics.json');
      log('data-unique: response.data: ${response.data} ');
      List<dynamic> topics = response.data as List<dynamic>;
      final result = topics
          .map<HomeModelTopics>(
            (e) => HomeModelTopics.fromMap(e),
          )
          .toList();

      log('data-unique: result: $result ');

      return result;
    } catch (e) {
      log('data-unique: e: $e ');
    }

    return [];
  }
}
