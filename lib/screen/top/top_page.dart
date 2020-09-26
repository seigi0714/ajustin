import 'package:adjustin_app/auth/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader read) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('トップページ'),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _bottomBarItem(const Icon(Icons.calendar_today), 'カレンダー'),
          _bottomBarItem(const Icon(Icons.person), 'マイページ')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

BottomNavigationBarItem _bottomBarItem(Widget icon, String title) {
  return BottomNavigationBarItem(icon: icon, title: Text(title));
}
