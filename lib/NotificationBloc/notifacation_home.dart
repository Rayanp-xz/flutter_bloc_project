import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'Notification_class.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NotificationBloc notificationBloc = BlocProvider.of<NotificationBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Notification App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                notificationBloc.showNotification('Widget Clicked!');
              },
              child: Text('Click Me'),
            ),
            SizedBox(height: 20),
            BlocBuilder<NotificationBloc, String>(
              builder: (context, message) {
                return Text('Notification: $message');
              },
            ),
          ],
        ),
      ),
    );
  }
}