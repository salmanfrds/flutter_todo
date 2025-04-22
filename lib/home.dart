import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/cards.dart';
import 'package:todo_app/input.dart';
import './todo_provider.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        titleTodo(context),
        searchTodo(context),
        todoList(context),
        InputNew()
      ],
    );
  }

  Widget searchTodo(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: _searchController,
        decoration: 
          InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            hintText: "Search Something Cool",
            suffixIcon: Icon(
              Icons.search
            )
          ),
      ),
    );
  }

  Widget todoList(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (BuildContext context, TodoProvider value, child) {
        final todos = value.todos; // Access the todos from the provider
        return Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index){
              final todo = todos[index];
              return TodoCard(todo: todo);
            }
          )
        );
      }
    );
  }

  Widget titleTodo(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "My TodoList",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
