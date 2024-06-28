import 'package:aloudeh_company/core/constants/colors_constants.dart';
import 'package:aloudeh_company/core/error/network_exceptions.dart';
import 'package:aloudeh_company/core/global_states/get_state.dart';
import 'package:aloudeh_company/features/warehouse/data/entity/notification_entity.dart';
import 'package:aloudeh_company/features/warehouse/presentation/controllers/get_notification_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetNotificationCubit>().emitGetNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications',style: TextStyle(color: AppColors.yellow),),
        backgroundColor: AppColors.darkBlue,
      ),
      body: BlocConsumer<GetNotificationCubit, GetState<BaseNotificationEntity>>(
        listener: (context, state) {
          state.whenOrNull(
            error: (error) {
              Fluttertoast.showToast(
                msg: NetworkExceptions.getErrorMessage(error),
                toastLength: Toast.LENGTH_SHORT,
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CupertinoActivityIndicator()),
            success: (data) => ListView.builder(
              itemCount: data.data.length,
              itemBuilder: (context, index) {
                final notification = data.data[index];
                return NotificationCard(notification: notification);
              },
            ),
            orElse: () => const Center(child: Text('No notifications available')),
          );
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationEntity notification;

  const NotificationCard({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 25,
              child: Icon(
                notification.type == 'trip' ? Icons.local_shipping : Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    notification.body,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  if (notification.type == 'trip')
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              // : Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              // Handle accept action
                            },
                            child: const Text('Accept',style: TextStyle(color: Colors.white),),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              // onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              // Handle reject action
                            },
                            child: const Text('Not Accept',style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
