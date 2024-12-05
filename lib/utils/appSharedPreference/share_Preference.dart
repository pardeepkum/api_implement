import 'dart:math';

import 'package:get_storage/get_storage.dart';

class AppSharedPreference{

  GetStorage? getStorage;

  Future<AppSharedPreference> initializeStorage() async{
    getStorage = GetStorage();
    await GetStorage.init();
    return this;

  }
  final token = ''.val('token');
  final language = 'en'.val('language');
  final lanModel = <String, dynamic>{}.val('lanModel');
  final tokenModel = <String, dynamic>{}.val('tokenModel');
  final calenderModel = <String, dynamic>{}.val('calenderModel');
  final stationModel = <String, dynamic>{}.val('stationModel');
  final loginModel = <String, dynamic>{}.val('LoginModel');
  final notificationModel = <String, dynamic>{}.val('NotificationModel');
  final orderSaveModel = <String, dynamic>{}.val('OrderModel');
  final languageCode = 10000000000.val('languageCode');

  void setToken( String authToken){
    token.val = authToken;
  }

  String getToken(){
    return token.val;
  }

  void setLanguage(String lang){
    language.val = lang;
  }
  String getLanguage(){
    return language.val;
  }

  void setLanguageCode(int lang){
    languageCode.val = lang;
  }

  int getLanguageCode(){
    return languageCode.val;
  }


  // clear the Storage data for saved data in locally data
  void clear() {
    final GetStorage storage = GetStorage();
    storage.erase();
  }

}