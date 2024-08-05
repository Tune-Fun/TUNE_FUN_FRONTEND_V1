import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _allNotifications = true;
  bool _artistNotification = true;
  bool _voteEndNotification = false;
  bool _videoUploadNotification = true;
  bool _videoProvisionSettingNotification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        title: const Text(
          '알림 설정',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: const Color.fromRGBO(255, 255, 255, 1),
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: _buildSwitchTile(
                  title: '전체 알림',
                  value: _allNotifications,
                  onChanged: (bool value) {
                    setState(() {
                      _allNotifications = value;
                    });
                  },
                  activeColor: Colors.redAccent,
                  trackColor: const Color.fromRGBO(153, 153, 153, 1),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "내가 팔로우하는 아티스트",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromRGBO(17, 17, 17, 1)),
              ),
              Card(
                color: const Color.fromRGBO(255, 255, 255, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: _buildSwitchTile(
                  title: '투표 진행 알림',
                  subtitle: '[아티스트]님이 투표를 게시하였습니다.',
                  value: _artistNotification,
                  onChanged: (bool value) {
                    if (_allNotifications) {
                      setState(() {
                        _artistNotification = value;
                      });
                    }
                  },
                  activeColor: _allNotifications
                      ? Colors.redAccent
                      : const Color.fromRGBO(209, 213, 219, 1),
                  trackColor: _allNotifications
                      ? const Color.fromRGBO(153, 153, 153, 1)
                      : const Color.fromRGBO(209, 213, 219, 1),
                  enabled: _allNotifications,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "내가 참여한 투표",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color.fromRGBO(17, 17, 17, 1)),
              ),
              Card(
                color: const Color.fromRGBO(255, 255, 255, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    _buildSwitchTile(
                      title: '투표 종료 알림',
                      subtitle: '[아티스트]님의 투표가 종료되었습니다. \n최종 선정된 곡을 확인해주세요.',
                      value: _voteEndNotification,
                      onChanged: (bool value) {
                        if (_allNotifications) {
                          setState(() {
                            _voteEndNotification = value;
                          });
                        }
                      },
                      activeColor: _allNotifications
                          ? Colors.redAccent
                          : const Color.fromRGBO(209, 213, 219, 1),
                      trackColor: _allNotifications
                          ? const Color.fromRGBO(153, 153, 153, 1)
                          : const Color.fromRGBO(209, 213, 219, 1),
                      enabled: _allNotifications,
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider()),
                    _buildSwitchTile(
                      title: '영상 업로드 알림',
                      subtitle: '[아티스트]님이 영상을 업로드 하였습니다.',
                      value: _videoUploadNotification,
                      onChanged: (bool value) {
                        if (_allNotifications) {
                          setState(() {
                            _videoUploadNotification = value;
                          });
                        }
                      },
                      activeColor: _allNotifications
                          ? Colors.redAccent
                          : const Color.fromRGBO(209, 213, 219, 1),
                      trackColor: _allNotifications
                          ? const Color.fromRGBO(153, 153, 153, 1)
                          : const Color.fromRGBO(209, 213, 219, 1),
                      enabled: _allNotifications,
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider()),
                    _buildSwitchTile(
                      title: '영상 제공일 설정 알림',
                      subtitle: '[아티스트]님이 제공일을 설정하였습니다.',
                      value: _videoProvisionSettingNotification,
                      onChanged: (bool value) {
                        if (_allNotifications) {
                          setState(() {
                            _videoProvisionSettingNotification = value;
                          });
                        }
                      },
                      activeColor: _allNotifications
                          ? Colors.redAccent
                          : const Color.fromRGBO(209, 213, 219, 1),
                      trackColor: _allNotifications
                          ? const Color.fromRGBO(153, 153, 153, 1)
                          : const Color.fromRGBO(209, 213, 219, 1),
                      enabled: _allNotifications,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool enabled = true,
    required Color activeColor,
    required Color trackColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(17, 17, 17, 1),
                    height: 2,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(107, 114, 128, 1),
                    ),
                  ),
              ],
            ),
          ),
          CupertinoSwitch(
            value: value,
            onChanged: enabled ? onChanged : null,
            activeColor: activeColor,
            trackColor: trackColor,
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
