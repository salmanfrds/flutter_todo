import 'package:flutter/material.dart';
import './todo.dart';  // Import the Todo model class (assuming you have it in a separate file)

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];
  // final List<Todo> _filteredTodo = [];

  int currTask = 0;

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

  void inputTodo(String title){
    currTask = currTask+1;
    final newTodo = Todo(
      id: currTask.toString(),
      title:  title
    );
    _todos.add(newTodo);
    notifyListeners();
  }
}