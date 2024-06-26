import 'package:aloudeh_company/core/utils/notification_viewer.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.dart';

@singleton
class NotificationCubit extends Cubit<NotificationState> {
  final FirebaseMessaging _firebaseMessaging;

  NotificationCubit(this._firebaseMessaging) : super(NotificationInitial()) {
    _initMessaging().then(
      (value) =>
          print('fcm token for messaging '),
    );
  }

  Future<void> _initMessaging() async {
    _getInitialMessage();
    await _setForegroundNotificationPresentationOptions();
    await _getFcmToken();
    _onTokenRefresh();

    _onMessaging();
    _onMessageOpenedApp();
  }

//todo handle on pressed and routing
  void _getInitialMessage() =>
      FirebaseMessaging.instance.getInitialMessage().then(
        (message) {
          if (message?.notification != null) {
            print(message?.notification!.body);
            print(message?.notification!.title);
          }
        },
      );
  Future<void> _setForegroundNotificationPresentationOptions() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void _onMessaging() {
    FirebaseMessaging.onMessage.listen(
      (message) {
        if (message.notification != null) {
          print(message.notification!.body);
          print(message.notification!.title);
          NotificationViewer.display(message);
        }
      },
    );
  }

  Future<void> _getFcmToken() async {
    await _firebaseMessaging
        .getToken();
        // .then((fcmToken) => AppSharedPreferences.fcmToken = fcmToken);
  }

  void _onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print(message.notification!.body);
        print(message.notification!.title);
      },
    );
  }

  void _onTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen(
      (fcmToken) {
        // AppSharedPreferences.fcmToken = fcmToken;
      },
    );
  }
}
