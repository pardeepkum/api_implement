import 'dart:developer';

import 'package:api_testing/model/home_model.dart';
import 'package:api_testing/utils/apiManager/api_constants.dart';
import 'package:api_testing/utils/apiManager/api_manager.dart';

class HomeRepository {
  ApiManager apiManager = ApiManager();

  Future<List<Post>> getPost() async {
    try {
      final response = await apiManager.get(
        APIConstants.listData,
        headers: {'Content-Type': 'application/json'},
        isCheckError: false,
      );
      return (response as List).map((item) => Post.fromJson(item)).toList();
    } catch (e, st) {
      log('$e $st');
      rethrow;
    }
  }
}
