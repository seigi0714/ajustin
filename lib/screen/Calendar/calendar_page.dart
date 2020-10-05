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
  List<Item> _selectedEvents = [];
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
                  // Switch out 2 lines below to play with TableCalendar's settings
                  //-----------------------
                  _buildTableCalendar(context, calendarState),
                  // _buildTableCalendarWithBuilders(),
                  const SizedBox(height: 8),
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
        onVisibleDaysChanged: (_, __, ___) {
          final DateTime headerDate = _calendarController.focusedDay;
          context.read(calendarProvider).onVisibleDaysChanged(headerDate);
        });
  }

  Widget _buildEventList(CalendarState calendarState) {
    return ConstrainedBox(
      constraints: BoxConstraints(),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: calendarState.selectedEvents.map((event) {
          return Card(
            child: ListTile(
              title: Text(event.summary +
                  _getDateTimeStr(event.start.dateTime, event.end.dateTime)),
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
