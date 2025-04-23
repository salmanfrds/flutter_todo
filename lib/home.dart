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
        searchTodo(context),
        todoList(context),
        InputNew()
      ],
    );
  }

  Widget searchTodo(BuildContext context){
    return Container(
      margin: EdgeInsets.all(16.0),
      child: SearchBar(
        controller: _searchController,
        leading: Icon(Icons.search),
        onChanged: (query){
          context.read<TodoProvider>().updateFilter(_searchController.text);
        },
      ),
    );
  }

  Widget todoList(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (BuildContext context, TodoProvider value, child) {
        final todos = value.filteredTodos; // Access the todos from the provider
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
