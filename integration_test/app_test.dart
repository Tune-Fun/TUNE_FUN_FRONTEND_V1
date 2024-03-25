import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:tunefun_front/constants/dummy_data.dart';
import 'package:tunefun_front/features/article/widgets/article_card.dart';
import 'package:tunefun_front/features/article/widgets/article_list.dart';
import 'package:tunefun_front/features/home/views/home_view.dart';
import 'package:tunefun_front/main.dart';
import 'package:patrol_finders/patrol_finders.dart';

void main() {
  testWidgets(
    'Main Screen test',
    (WidgetTester tester) async {
      PatrolTester $ = PatrolTester(
        tester: tester,
        config: const PatrolTesterConfig(),
      );
      await $.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );
      expect($('TuneFun'), findsWidgets);
      expect($(const HomeScreen()), findsOneWidget);
      expect($(const ArticleList()), findsWidgets);
    },
  );
}
