import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/moodels/todoDM.dart';

class ListProvider extends ChangeNotifier {
  List<TodoDM> todos = [];
  DateTime selectDate = DateTime.now();

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
    QuerySnapshot<TodoDM> todoSnapshot =
        await todoCollection.orderBy("date").get();

    List<QueryDocumentSnapshot<TodoDM>> docs = todoSnapshot.docs;

    todos = docs.map((docSnapshot) {
      return docSnapshot.data();
    }).toList();

    todos=todos.where((todo) {
        if (todo.date.day != selectDate.day ||
            todo.date.month != selectDate.month ||
            todo.date.year != selectDate.year) {
          return false;
        }else {
          return true;
        }
    }).toList();
    notifyListeners();
  }
}
