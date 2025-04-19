import 'package:flutter/material.dart';
import './todo.dart';  // Import the Todo model class (assuming you have it in a separate file)

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(id: "1", title: "eat"),
    Todo(id: "2", title: "wakeup"),
  ];

  List<Todo> get todos => _todos; 

  void setDone(String id, bool done){
    final todo = _todos.firstWhere((todo) => todo.id == id);
    if(done){
      todo.markAsDone();
    } else {
      todo.markAsUnDone();
    }
    notifyListeners();
  }
}