import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/View/Assignment/bloc/assignment_bloc.dart';
import 'package:coursia/View/Auth/Page/splash_page.dart';
import 'package:coursia/View/Auth/bloc/auth_bloc.dart';
import 'package:coursia/View/Blog/bloc/blog_bloc.dart';
import 'package:coursia/View/Checkout/bloc/checkout_bloc.dart';
import 'package:coursia/View/Competency/bloc/competency_bloc.dart';
import 'package:coursia/View/Courses/bloc/courses_bloc.dart';
import 'package:coursia/View/DISC/bloc/disc_bloc.dart';
import 'package:coursia/View/Evaluation/bloc/evaluation_bloc.dart';
import 'package:coursia/View/Gift/bloc/gift_bloc.dart';
import 'package:coursia/View/Home/bloc/home_bloc.dart';
import 'package:coursia/View/IQ/bloc/iq_bloc.dart';
import 'package:coursia/View/Multiple_Choice/bloc/multiple_choice_bloc.dart';
import 'package:coursia/View/Profile/bloc/profile_bloc.dart';
import 'package:coursia/View/Quiz/bloc/quiz_bloc.dart';
import 'package:coursia/bloc/my_bloc_observer.dart';
import 'package:coursia/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  ///To open when use noti
  /* await Firebase.initializeApp(
    name: "coursia",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var token = await FirebaseMessaging.instance.getToken();
  log(token.toString());
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    // print('Got a message whilst in the foreground!');
    if (message.notification != null) {
      // print('Notification Title: ${message.notification!.title}');
      // print('Notification Body: ${message.notification!.body}');
    }

    await setupFlutterNotifications();
    showFlutterNotification(message);
  });*/

  initialization();
  FlutterNativeSplash.remove();
  await Hive.initFlutter();
  await Hive.openBox('library_db');
  await GetStorage.init();
  runApp(const MyApp());
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'launch_background',
        ),
      ),
    );
  }
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

Future initialization() async {
  await Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoursesBloc>(create: (_) => CoursesBloc()),
        BlocProvider<ProfileBloc>(create: (_) => ProfileBloc()),
        BlocProvider<DISCBloc>(create: (_) => DISCBloc()),
        BlocProvider<QuizBloc>(create: (_) => QuizBloc()),
        BlocProvider<IqBloc>(create: (_) => IqBloc()),
        BlocProvider<CompetencyBloc>(create: (_) => CompetencyBloc()),
        BlocProvider<CheckoutBloc>(create: (_) => CheckoutBloc()),
        BlocProvider<MultipleChoiceBloc>(create: (_) => MultipleChoiceBloc()),
        BlocProvider<GiftBloc>(create: (_) => GiftBloc()),
        BlocProvider<EvaluationBloc>(create: (_) => EvaluationBloc()),
        BlocProvider<AssignmentBloc>(create: (_) => AssignmentBloc()),
        BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
        BlocProvider<BlogBloc>(create: (_) => BlogBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Coursia',
            theme: AppTheme.getTheme(),
            home: child,
          );
        },
        child: const SplashPage(),
      ),
    );
  }
}
