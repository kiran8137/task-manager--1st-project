
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:manage_your/main.dart';
import 'package:manage_your/views/taskdetail/taskdetail.dart';

class NotificationService{
  static Future<void> initializeNofication() async{
    await AwesomeNotifications().initialize(null,
     [
      NotificationChannel(
        channelGroupKey: 'high_importance_channel',
        channelKey: 'scheduled', 
        channelName: 'Basic notifications', 
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Colors.white,
        ledColor: Colors.black,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
        onlyAlertOnce: true,
        playSound: true,
        criticalAlerts: true
        )
     ],
     channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: "high_importance_channel_group", 
        channelGroupName: 'Group 1')
     ],
     debug: true
     );

     await AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) async {
        if(!isAllowed){
          await AwesomeNotifications().requestPermissionToSendNotifications();
        }
      }
      );

      await AwesomeNotifications().setListeners(
        onActionReceivedMethod: onActionReceivedMethod,
        onNotificationCreatedMethod : onNotificationCreatedMethod,
        onNotificationDisplayedMethod : onNotificationDisplayedMethod,
        onDismissActionReceivedMethod : onDismissActionReceivedMethod,


        );
  }

  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification)async{
      //print('onNotificationCreatedMethod');
  }

  static Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification)async {
      //print("onNotificationDisplayedMethod");
  }

  static Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction)async {
     // print('onDismissActionReceivedMethod');
  }

  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction) async{
      //print('onActionReceivedMethod');
      final payload = receivedAction.payload ?? {};
      if(payload["navigate"] == true){
        
        MyApp.navigatorkey.currentState?.push(
          MaterialPageRoute(builder: (_)=>const TaskDetailView())
        );
      }
  }

  static Future<void> showNotification({
    // DateTime? scheduledday,
    // TimeOfDay? scheduletime,
    int? day, 
    int? month ,
    int? year ,
    int? hour  ,
    int? minute , 
     

    required final String title,
    required final String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.Default,
    final NotificationCategory? category,
    final String? bigpicture,
    final List<NotificationActionButton>? actionbutton,
    final bool scheduled = false,
    final int? interval,


  })
    

  async {
    

   // assert(!scheduled || (scheduled && interval !=null ));

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
         
        channelKey: 'scheduled',
        title: title,
        body: body,
        actionType: actionType,
        notificationLayout: notificationLayout,
        summary: summary,
        category: category,
        payload: payload,
        bigPicture: bigpicture
        ),
        actionButtons: actionbutton,
        schedule: 
        // NotificationInterval(
        //   interval: 24,
           
          
        //   )
        NotificationCalendar(
          // day: day,
          // month: month,
          // year: year,
          // hour: hour,
          // minute: minute, 
           
          hour: 16,
          minute: 52,
           
           
          allowWhileIdle: true
        )
        // scheduled?NotificationInterval(
        //   interval: interval,
        //   timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        //   preciseAlarm: false
        //   ):null
        );
  }

  
}
