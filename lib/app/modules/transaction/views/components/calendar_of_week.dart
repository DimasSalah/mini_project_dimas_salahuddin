import 'package:flutter/material.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

import '../../../../themes/colors.dart';

class CalendarOfWeek extends StatelessWidget {
  final Function(DateTime) onChangedSelectedDate;
  const CalendarOfWeek({
    super.key,
    required this.onChangedSelectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return WeeklyCalendar(
      calendarStyle: CalendarStyle(
        locale: 'id_ID',
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 1),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        isShowHeaderDateText: false,
        footerDateTextColor: dark,
        isShowFooterDateText: false,
        selectedCircleColor: lightActive,
        todaySelectedCircleColor: dark,
        dayTextColor: dark,
        todayDayTextColor: success,
        selectedDayTextColor: white,
        weekendDayTextColor: lightActive,
        dayOfWeekTextColor: darkActive,
        weekendDayOfWeekTextColor: lightActive,
      ),
      isAutoSelect: true,
      onChangedSelectedDate: (date) {
        onChangedSelectedDate(date);
      },
    );
  }
}
