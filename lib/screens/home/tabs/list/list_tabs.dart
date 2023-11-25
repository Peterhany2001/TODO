
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/moodels/todoDM.dart';
import 'package:todo/screens/home/tabs/list/todo_widget/todo_widget.dart';
import 'package:todo/ui/utilts/app_colors.dart';

class ListTab extends StatefulWidget {
  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  List<TodoDM> todos = [];

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      refreshTodoList();
    }
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
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) => print(date),
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
              itemCount: todos.length,
              itemBuilder: (context, index) => TodoWidget(
                    model: todos[index],
                  )),
        ),
      ],
    );
  }

  refreshTodoList() async {
    CollectionReference<TodoDM> todoCollection = FirebaseFirestore.instance
        .collection(TodoDM.collectionName)
        .withConverter<TodoDM>(fromFirestore: (docSnapShot, _) {
      Map json = docSnapShot.data() as Map;
      TodoDM todo = TodoDM.fromJson(json);
      return todo;
    }, toFirestore: (todoDm, _) {
      return todoDm.toJson();
    });
    QuerySnapshot<TodoDM> todoSnapshot = await todoCollection.get();

    List<QueryDocumentSnapshot<TodoDM>> docs = todoSnapshot.docs;

    for (int i = 0; i < docs.length; i++) {
     todos.add(docs[i].data());
    }
    setState(() {});
  }
}
