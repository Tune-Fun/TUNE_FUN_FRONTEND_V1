import 'package:flutter/material.dart';
import 'package:tunefun_front/features/setting/view/account_setting_view.dart';
import 'package:tunefun_front/features/setting/view/agreement/agreement_view.dart';
import 'package:tunefun_front/features/setting/view/customer_service/customer_service_view.dart';
import 'package:tunefun_front/features/setting/view/inquiry/inquiry_view.dart';
import 'package:tunefun_front/features/setting/view/notification/notification_view.dart';
import 'package:tunefun_front/features/setting/view/report/report_view.dart';

class SettingMainView extends StatelessWidget {
  const SettingMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        title: const Text(
          '설정 및 개인정보',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionHeader(title: '정보'),
                  SettingsListTile(
                      title: '계정 정보',
                      onTap: () {
                        onAccountInfoTap(context);
                      }),
                  SettingsListTile(
                      title: '알림 설정',
                      onTap: () {
                        onNotificationSettingsTap(context);
                      }),
                  const SettingsListTile(
                      title: '결제 내역', onTap: _onPaymentHistoryTap),
                  SettingsListTile(
                      title: '약관 및 정책',
                      onTap: () {
                        onTermsAndPolicyTap(context);
                      }),
                ],
              ),
            ),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(title: '도움말'),
                  SettingsListTile(
                      title: '신고', onTap: () => onReportTap(context)),
                  SettingsListTile(
                      title: '고객센터',
                      onTap: () => onCustomerServiceTap(context)),
                  SettingsListTile(
                      title: '이용문의', onTap: () => onInquiriesTap(context)),
                  SettingsListTile(title: '웹 버전', onTap: _onWebVersionTap),
                ],
              ),
            ),
            Container(
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text(
                    '로그아웃',
                    style: TextStyle(
                      color: Color.fromRGBO(17, 17, 17, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: _onLogoutTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onAccountInfoTap(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AccountSettingScreen()));
  }

  static void onNotificationSettingsTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const NotificationSettingsScreen()));
  }

  static void _onPaymentHistoryTap() {
    // 결제 내역 페이지로 이동하는 로직 추가
  }

  void onTermsAndPolicyTap(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AgreementScreen()));
  }

  void onReportTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ReportView()));
  }

  void onCustomerServiceTap(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CustomerServiceView()));
  }

  void onInquiriesTap(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const InquiryScreen()));
  }

  static void _onWebVersionTap() {
    // 웹 버전 페이지로 이동하는 로직 추가
  }

  static void _onLogoutTap() {
    // 로그아웃 로직 추가
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Color.fromRGBO(17, 17, 17, 1)),
      ),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SettingsListTile({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios,
            size: 16, color: Color.fromRGBO(102, 102, 102, 1)),
        onTap: onTap,
      ),
    );
  }
}
