import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/features/home/views/home_view.dart';
import 'package:tunefun_front/features/vote/presentation/views/vote_detail_view.dart';
import 'package:tunefun_front/features/vote/presentation/views/vote_upload_view.dart';
import 'package:tunefun_front/firebase_options.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/config/.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isConfigured = false;

  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TuneFun',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        // home: const HomeScreen(),
        home: VoteDetailScreen()
        // home: const VoteUploadScreen(),
        // home: const FcmTestScreen(),
        );
  }
}
