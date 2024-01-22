import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/res/colours.dart';
import 'package:todo_app/core/services/notification_service.dart';
import 'package:todo_app/features/authentication/app/user_provider.dart';
import 'package:todo_app/features/on_boarding/views/on_boarding_screen.dart';
import 'package:todo_app/features/todo/views/home_screen.dart';
import  'package:todo_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 843.4),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Todo App',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
            scaffoldBackgroundColor: Colours.darkBackground,
            useMaterial3: true,
          ),
          home: ref.watch(userProvider).when(
              data: (userExists) {
                if(userExists) return const HomeScreen();
                return const OnBoardingScreen();
              },
              error: (error, stackTrace) {
                debugPrint('ERROR: $error');
                debugPrint(stackTrace.toString());
                return const OnBoardingScreen();
              },
              loading: () {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }),
        );
      },
    );
  }
}
