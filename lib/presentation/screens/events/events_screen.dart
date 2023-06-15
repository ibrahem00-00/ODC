import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:workshopodc/constants/app_colors.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: const BackButton(color: Colors.white,),
        title: Text("Events",style: TextStyle(fontSize: 20.sp,color: Colors.white),),),
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings:  const MonthViewSettings(
              //showAgenda: true,
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.utc(2022,10,5);
    final DateTime today1 = DateTime.utc(2022,11,6);
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9, 7, 0);
    final DateTime startTime1 = DateTime(today1.year, today1.month, today1.day, 10, 5, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    final DateTime endTime1 = startTime.add(const Duration(hours: 4));
    meetings.add(
        Meeting('Conference', startTime, endTime, AppColors.primaryColor, false));
    meetings.add(Meeting('eventName',startTime1 , endTime1, AppColors.primaryColor, false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

