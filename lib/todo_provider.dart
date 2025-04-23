import 'package:flutter/material.dart';
import './todo.dart';  // Import the Todo model class (assuming you have it in a separate file)

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];
  String _filterQuery = "";

  int currTask = 0;

  List<Todo> get todos => _todos; 
  List<Todo> get filteredTodos {
    if (_filterQuery.isEmpty){
      return _todos;
    } else {
      return _todos.where((todo) => todo.title.toLowerCase().contains(_filterQuery.toLowerCase())).toList();
    }
  }

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

  void updateFilter(String query){
    _filterQuery = query;
    notifyListeners(); 
  }
}