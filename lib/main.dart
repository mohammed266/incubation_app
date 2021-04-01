import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:incubation_app/shared/shared_helper.dart';
import 'package:incubation_app/views/splash/splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.logged();
  print(SharedHelper.password);
  runApp(
    EasyLocalization(
      saveLocale: true,
      supportedLocales: [Locale('ar', 'SA'), Locale('en', 'US')],
      path: 'assets/lang',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  var initializationSettingsAndroid;

  var initializationSettingsIos;

  var initializationSettings;

  void _showNotification(var title , var body)async{
    await _demoNotification(title , body);
  }

  Future<void> _demoNotification(var title , var body)async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel_Name', 'channel_Description',importance: Importance.max,
        priority: Priority.high , ticker: 'test ticker');
    var iosChannelSpecifics = IOSNotificationDetails(sound: "slow_spring_board.aiff");
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosChannelSpecifics);
    flutterLocalNotificationsPlugin.show(0,title,body, platformChannelSpecifics,payload: 'Custom_Sound');
  }

  Future onDidReceiveLocalNotification(int id , String title , String body ,String payload)async{
    await showDialog(context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: ()async{
              Navigator.of(context , rootNavigator: true).pop();
              await Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondRoute()));
            },
            isDefaultAction: true,
            child: Text('ok'),
          )
        ],
      ),
    );
  }

  Future onSelectNotification(String payload)async{
    if(payload!=null){
      // debugPrint('Notification payload $payload');
    }
    // await Navigator.push(context, MaterialPageRoute(builder: (context)=> TabsScreen(screenIndex: 0,)));
  }

  @override
  void initState(){
    _showNotification("hi", "hiBody");
    initializationSettingsAndroid = AndroidInitializationSettings('ic_launcher');
    initializationSettingsIos = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(android: initializationSettingsAndroid,iOS: initializationSettingsIos);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    super.initState();
    FirebaseMessaging().configure(
      onMessage: (Map<String, dynamic> message) async {
        _showNotification(message['notification']['title'],message['notification']['body']);
        FlutterRingtonePlayer.playNotification(
          looping: false, // Android only - API >= 28
          volume: 0.5, // Android only - API >= 28
          asAlarm: false,
          // Android only - all APIs
        );
      },
      onResume: (Map<String, dynamic> message) async {
        _showNotification(message['notification']['title'],message['notification']['body']);
        FlutterRingtonePlayer.playNotification(
          looping: false, // Android only - API >= 28
          volume: 0.5, // Android only - API >= 28
          asAlarm: false, // Android only - all APIs
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        _showNotification(message['notification']['title'],message['notification']['body']);
        FlutterRingtonePlayer.playNotification(
          looping: false, // Android only - API >= 28
          volume: 0.5, // Android only - API >= 28
          asAlarm: false, // Android only - all APIs
        );
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('AlertPage'),),
        body: Center(child: RaisedButton(child: Text('go Back ...'),onPressed: (){
          Navigator.pop(context);
        },)));
  }
}