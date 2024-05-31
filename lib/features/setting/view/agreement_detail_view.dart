import 'package:flutter/material.dart';
import 'package:tunefun_front/constants/agreement_data.dart';

class AgreementDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const AgreementDetailScreen({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['title'],
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(child: _buildContent()),
    );
  }

  Widget _buildContent() {
    switch (data['type']) {
      case 'agreement':
        return _agreementBox();
      case 'privacyPolicy':
        return _privacyPolicyBox();
      default:
        return const SizedBox();
    }
  }

  Widget _agreementBox() {
    return Container(
      margin: const EdgeInsets.only(left: 12, top: 30, right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      child: Text(data['content']),
    );
  }

  Widget _privacyPolicyBox() {
    return Container(
      margin: const EdgeInsets.only(left: 12, top: 30, right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      child: Text(data['content']),
    );
  }
}
