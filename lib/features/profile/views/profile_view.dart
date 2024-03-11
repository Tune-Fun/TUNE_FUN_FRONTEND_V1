import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/features/auth/controllers/auth_controller.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${user?.username}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey,
                    ),
                    Text("팔로잉 : 200"),
                  ],
                ),
              ),
              // 계정 연동 된 플랫폼 위젯
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {},
                      child: const Text(
                        "구독",
                        style: TextStyle(color: Colors.black),
                      )),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {},
                      child: const Text(
                        "프로필 편집",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TabBar(
                labelColor: Colors.black,
                controller: _tabController,
                tabs: const [
                  Tab(icon: Icon(Icons.list)),
                  Tab(icon: Icon(Icons.queue_music)),
                  Tab(icon: Icon(Icons.heart_broken)),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [Container(), Container(), Container()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
