import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/features/firebase/test/fcm_view.dart';
import 'package:tunefun_front/features/home/views/home_view.dart';
import 'package:tunefun_front/firebase_options.dart';
import 'package:tunefun_front/amplifyconfiguration.dart';
import 'package:tunefun_front/features/vote/views/vote_detail_view.dart';
import 'package:tunefun_front/features/vote/views/vote_upload_view.dart';
import 'package:tunefun_front/theme/theme.dart';

var logger = Logger();

void main() {
  runApp(const MyApp());
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
      // home: const VoteDetailScreen(),
    );
  }
}
