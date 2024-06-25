
import 'package:aloudeh_company/core/utils/shared_preference_utils.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class ThirdPartyInjection {
  @singleton
  Dio get dio => Dio();
  @singleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
      @singleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;
  @singleton
  SharedPreferencesUtils get sharedPreferencesUtils => SharedPreferencesUtils();
}
