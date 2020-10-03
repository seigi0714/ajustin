import 'package:adjustin_app/screen/AddSchedule/add_schedule_page.dart';
import 'package:adjustin_app/screen/Calendar/calendar_page.dart';
import 'package:adjustin_app/screen/My/my_page.dart';
import 'package:adjustin_app/screen/top/top_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends StatelessWidget {
  final StateNotifierProvider<TopController> pageProvider =
      StateNotifierProvider((ref) => TopController());

  @override
  List<StatelessWidget> currentPage = [
    CalendarPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final pageState = watch(pageProvider.state);
      return Scaffold(
        body: currentPage[pageState.pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageState.pageIndex,
          onTap: (index) {
            context.read(pageProvider).changePageIndex(index);
          },
          items: [
            _bottomBarItem(const Icon(Icons.calendar_today), 'カレンダー'),
            _bottomBarItem(const Icon(Icons.person), 'マイページ')
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute<Widget>(
                builder: (context) {
                  return AddSchedulePage();
                },
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}

BottomNavigationBarItem _bottomBarItem(Widget icon, String title) {
  return BottomNavigationBarItem(icon: icon, title: Text(title));
}
