import 'package:adjustin_app/auth/wrapper.dart';
import 'package:adjustin_app/domain/event_model.dart';
import 'package:adjustin_app/domain/user_model.dart';
import 'package:adjustin_app/screen/Calendar/calendar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  CalendarPage({this.user, this.calendarProvider});
  UserData user;
  StateNotifierProvider<CalendarStateController> calendarProvider;
  final CalendarController _calendarController = CalendarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('予定'),
      ),
      body: Consumer(builder: (context, watch, child) {
        final calendarState = watch(calendarProvider.state);
        return calendarState.loading
            ? CircularProgressIndicator()
            : Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _buildTableCalendar(context, calendarState),
                  // _buildTableCalendarWithBuilders(),
                  const SizedBox(height: 8),
                  Expanded(child: _buildEventList(calendarState)),
                ],
              );
      }),
    );
  }

  Widget _buildTableCalendar(
      BuildContext context, CalendarState calendarState) {
    return TableCalendar(
      events: calendarState.events,
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
      onDaySelected: (date, events) {
        context.read(calendarProvider).onDaySelected(date, events);
      },
    );
  }

  Widget _buildEventList(CalendarState calendarState) {
    final List<Widget> _eventLists = calendarState.selectedEvents.map((event) {
      return ListTile(
          leading: _getDateTimeStr(event.start.dateTime, event.end.dateTime,
              calendarState.focusDate),
          title: Text(event.summary));
    }).toList();
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5),
                Text(_focusDate(calendarState.focusDate) + 'の予定'),
                ListView.separated(
                    itemCount: calendarState.selectedEvents.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                          color: Colors.black,
                        ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return _eventLists[index];
                    }),
              ],
            ),
          )),
    );
  }

  String _focusDate(DateTime date) {
    return DateFormat('yyyy/MM/dd').format(date);
  }

  Widget _getDateTimeStr(
      DateTime startDate, DateTime endDate, DateTime focusDate) {
    DateFormat formatter = DateFormat('hh:mm');
    String startTime = formatter.format(startDate).toString();
    String endTime = formatter.format(endDate).toString();
    // その日スタートの予定かどうか
    bool isStartToday = focusDate.difference(startDate).inDays == 0 &&
        focusDate.day == startDate.day;
    // その日に終わる予定かどうか
    bool isEndToday = focusDate.difference(endDate).inDays == 0 &&
        focusDate.day == endDate.day;
    return Column(children: [
      Text(
        startTime,
        style: TextStyle(color: isStartToday ? Colors.black : Colors.grey),
      ),
      Text('｜'),
      Text(
        endTime,
        style: TextStyle(color: isEndToday ? Colors.black : Colors.grey),
      )
    ]);
  }
}
