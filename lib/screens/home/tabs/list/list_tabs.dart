import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/moodels/todoDM.dart';
import 'package:todo/screens/home/tabs/list/todo_widget/todo_widget.dart';
import 'package:todo/ui/provider/list_provider.dart';
import 'package:todo/ui/utilts/app_colors.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  late ListProvider provider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshTodoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .14,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        color: AppColors.primary,
                      )),
                  Expanded(
                      flex: 7,
                      child: Container(
                        color: AppColors.accent,
                      )),
                ],
              ),
              CalendarTimeline(
                initialDate: provider.selectDate,
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) {
                  provider.selectDate = date;
                  provider.refreshTodoList();
                },
                leftMargin: 20,
                monthColor: AppColors.white,
                dayColor: AppColors.primary,
                activeDayColor: AppColors.primary,
                activeBackgroundDayColor: AppColors.white,
                dotsColor: AppColors.transparent,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: provider.todos.length,
              itemBuilder: (context, index) => TodoWidget(
                    model: provider.todos[index],
                  )),
        ),
      ],
    );
  }
}
