import 'package:adjustin_app/auth/wrapper.dart';
import 'package:adjustin_app/domain/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

final _selectedDay = DateTime.now();

class CalendarPage extends StatelessWidget {
  List<Item> _selectedEvents = [
    Item(
        'play',
        'テニス',
        '友達と一緒に行う',
        '東京',
        Creator(email: 'seigibus@ya'),
        Start(dateTime: DateTime.now()),
        End(dateTime: DateTime.now().add(Duration(minutes: 30) * -1)))
  ];
  final CalendarController _calendarController = CalendarController();
  final Map<DateTime, List<dynamic>> _events = {
    _selectedDay.subtract(Duration(days: 30)): [
      'Event A0',
      'Event B0',
      'Event C0'
    ],
    _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
    _selectedDay.subtract(Duration(days: 20)): [
      'Event A2',
      'Event B2',
      'Event C2',
      'Event D2'
    ],
    _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
    _selectedDay.subtract(Duration(days: 10)): [
      'Event A4',
      'Event B4',
      'Event C4'
    ],
    _selectedDay.subtract(Duration(days: 4)): [
      'Event A5',
      'Event B5',
      'Event C5'
    ],
    _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
    _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7'],
    _selectedDay.add(Duration(days: 1)): [
      'Event A8',
      'Event B8',
      'Event C8',
      'Event D8'
    ],
    _selectedDay.add(Duration(days: 3)): ['Event A9', 'Event A9', 'Event B9'],
    _selectedDay.add(Duration(days: 7)): [
      'Event A10',
      'Event B10',
      'Event C10'
    ],
    _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
    _selectedDay.add(Duration(days: 17)): [
      'Event A12',
      'Event B12',
      'Event C12',
      'Event D12'
    ],
    _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
    _selectedDay.add(Duration(days: 26)): [
      'Event A14',
      'Event B14',
      'Event C14'
    ],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('予定'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          // _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8),
          _buildButtons(),
          const SizedBox(height: 8),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      events: _events,
      calendarController: _calendarController,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            const TextStyle().copyWith(color: Colors.white, fontSize: 15),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16),
        ),
      ),
//      onDaySelected: _onDaySelected,
//      onVisibleDaysChanged: _onVisibleDaysChanged,
//      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildButtons() {
    final dateTime = _events.keys.elementAt(_events.length - 2);
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Month'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('2 weeks'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('Week'),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        RaisedButton(
          child: Text(
              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
          onPressed: () {
            _calendarController.setSelectedDay(
              DateTime(dateTime.year, dateTime.month, dateTime.day),
              runCallback: true,
            );
          },
        ),
      ],
    );
  }

  Widget _buildEventList() {
    return ConstrainedBox(
      constraints: BoxConstraints(),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: _selectedEvents.map((event) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.8),
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
            child: ListTile(
              title: Text(event.summary +
                  _getDateTimeStr(event.start.dateTime, event.end.dateTime)),
// ゆくゆくは詳細を作成する
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) =>
//                        HomeDetailPage(itemHolder: _selectedEvents),
//                  ),
//                );
//              },
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getDateTimeStr(DateTime startDate, DateTime endDate) {
    DateFormat formatter = DateFormat.Md().add_jm();
    String startTime = formatter.format(startDate).toString();
    String endTime = formatter.format(endDate).toString();

    return "( " + startTime + '~' + endTime + ")";
  }
}
