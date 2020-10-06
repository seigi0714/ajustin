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
      builders: _calendarBuilder(),
      startingDayOfWeek: StartingDayOfWeek.sunday,
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      onDaySelected: (date, events) {
        context.read(calendarProvider).onDaySelected(date, events);
      },
    );
  }

  CalendarBuilders _calendarBuilder() {
    return CalendarBuilders(
      selectedDayBuilder: (context, date, _) {
        return Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.only(top: 5.0, left: 6.0),
          color: Colors.black26,
          width: 100,
          height: 100,
          child: Text(
            '${date.day}',
            style: TextStyle().copyWith(fontSize: 16.0),
          ),
        );
      },
      todayDayBuilder: (context, date, _) {
        return Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.only(top: 5.0, left: 6.0),
          color: Colors.black12,
          width: 100,
          height: 100,
          child: Text(
            '${date.day}',
            style: TextStyle().copyWith(fontSize: 16.0),
          ),
        );
      },
      markersBuilder: (context, date, events, holidays) {
        final children = <Widget>[];
        if (events.isNotEmpty) {
          children.add(
            _buildEventsMarker(date, events),
          );
        }

        if (holidays.isNotEmpty) {
          children.add(
            Positioned(
              right: -2,
              top: -2,
              child: _buildHolidaysMarker(),
            ),
          );
        }
        return children;
      },
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return events.length >= 5
        ? Positioned(
            right: 1,
            bottom: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: _calendarController.isSelected(date)
                    ? Colors.brown[500]
                    : _calendarController.isToday(date)
                        ? Colors.brown[300]
                        : Colors.blue[400],
              ),
              width: 16.0,
              height: 16.0,
              child: Center(
                child: Text(
                  '${events.length}',
                  style: TextStyle().copyWith(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          )
        : Positioned(
            bottom: 4,
            child: Container(
              width: 50,
              padding: EdgeInsets.all(2.0),
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                runSpacing: 3.0,
                children: events.map((event) {
                  return Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ));
                }).toList(),
              ),
            ),
          );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
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
                Text(_focusDate(calendarState.focusDate)),
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
