import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tunefun_front/constants/ui_constants.dart';
import 'package:tunefun_front/features/vote/presentation/widgets/gradient_container.dart';
import 'package:tunefun_front/theme/pallete.dart';

class SearchFromSpotifyWidget extends ConsumerWidget {
  const SearchFromSpotifyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchSpotifyController = TextEditingController();
    return Scaffold(
      appBar: UIConstants.appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: TextField(
                  controller: searchSpotifyController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "검색",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GradientContainer(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  borderRadius: BorderRadius.circular(12),
                  child: ListView.separated(
                    itemCount: 6,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text('$index 번째 노래'),
                        subtitle: Text('$index 번째 아티스트'),
                      );
                    }),
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.white,
                    ),
                  ),
                  type: "contentBox"),
            ],
          ),
        ),
      ),
    );
  }
}
