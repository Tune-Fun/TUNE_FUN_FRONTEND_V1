import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tunefun_front/features/home/views/home_view.dart';
import 'package:tunefun_front/theme/theme.dart';
import 'amplifyconfiguration.dart';

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
    _configureAmplify();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuneFun',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }

  void _configureAmplify() async {
    final auth = AmplifyAuthCognito();
    final analytics = AmplifyAnalyticsPinpoint();

    try {
      Amplify.addPlugins([auth, analytics]);
      await Amplify.configure(amplifyconfig);
      isConfigured = true;
    } catch (e) {
      logger.e(e);
    }

    if (isConfigured) {
      logger.i('Successfully configured Amplify 🎉');
    }
  }
}
