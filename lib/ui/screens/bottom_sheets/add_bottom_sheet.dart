import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/moodels/todoDM.dart';
import 'package:todo/ui/comman/my_text_field.dart';
import 'package:todo/ui/provider/list_provider.dart';
import 'package:todo/ui/utilts/AppTheme.dart';
import 'package:todo/ui/utilts/app_colors.dart';

class AddBottomSheet extends StatefulWidget {
  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController DescriptionContrroller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late ListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider=Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Add New task",
              textAlign: TextAlign.center,
              style: AppTheme.bottomSheetTitleTextStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            MyTextField(
                hintText: "Enter Task title", controller: titleController),
            const SizedBox(
              height: 8,
            ),
            MyTextField(
                hintText: "Enter Task description",
                controller: DescriptionContrroller),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Select date",
              style: AppTheme.bottomSheetTitleTextStyle
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            InkWell(
                onTap: () {
                  showMydatePicker();
                },
                child: Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  textAlign: TextAlign.center,
                  style: AppTheme.bottomSheetTitleTextStyle.copyWith(
                      fontWeight: FontWeight.normal, color: AppColors.gray),
                )),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  addTodoToFirestore();
                },
                child: const Text("Add")),
          ],
        ),
      ),
    );
  }

  void addTodoToFirestore() {
    CollectionReference todoCollectionRef =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);

    DocumentReference newEmptyDoc = todoCollectionRef.doc();
    newEmptyDoc.set({
      "id": newEmptyDoc.id,
      "title": titleController.text,
      "description": DescriptionContrroller.text,
      "date": selectedDate,
      "isDone": false,
    }).timeout(Duration(milliseconds: 300), onTimeout: () {
      provider.refreshTodoList();
      Navigator.pop(context);
    });
  }

  void showMydatePicker() async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365))
    ) ??
        selectedDate;
    setState(() {});
  }
}
