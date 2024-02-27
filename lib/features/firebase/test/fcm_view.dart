import 'package:flutter/material.dart';
import 'package:tunefun_front/features/firebase/test/fcm_controller.dart';

class FcmTestScreen extends StatefulWidget {
  const FcmTestScreen({super.key});

  @override
  State<FcmTestScreen> createState() => _FcmTestScreenState();
}

class _FcmTestScreenState extends State<FcmTestScreen> {
  @override
  void initState() {
    FCMController.init();
    Future.delayed(const Duration(seconds: 3),
        FCMController.requestNotificationPermission());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () => FCMController.showNotification(),
              child: const Text("send")),
        ]),
      ),
    );
  }
}
