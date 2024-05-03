import 'package:flutter/material.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

import '../../../../themes/colors.dart';

class CalendarBar extends StatelessWidget {
  const CalendarBar({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      WeeklyCalendar(
              calendarStyle: CalendarStyle(
                locale: 'id_ID',
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: darkHover,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),
                isShowHeaderDateText: false,
                footerDateTextColor: greenAccent,
                footerDateTextAlign: Alignment.center,
                isShowFooterDateText: true,
                selectedCircleColor: white,
                todaySelectedCircleColor: greenAccent,
                dayTextColor: white,
                todayDayTextColor: greenAccent,
                selectedDayTextColor: darker,
                weekendDayTextColor: lightActive,
                dayOfWeekTextColor: Colors.white,
                weekendDayOfWeekTextColor: lightActive,
                
              ),
              isAutoSelect: true,
              onChangedSelectedDate: (date) {
                print(date);
              },
            );
  }
}