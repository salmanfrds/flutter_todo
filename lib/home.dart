import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import './todo.dart';
import './todo_provider.dart';

class Todos extends StatelessWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchBar(context),
        titleTodo(context),
        todoList(context)
      ],
    );
  }

  Widget todoList(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (BuildContext context, TodoProvider value, Widget? child) {
        final todos = value.todos; // Access the todos from the provider
        return Wrap(
          children: todos.map(
            (todo) => SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        todo.id,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        todo.title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        todo.isDone == true
                          ? "Done"
                          : "not done yet",
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ),
                    Checkbox(
                      value: todo.isDone, 
                      onChanged: (bool? value){
                        if (value != null){
                          Provider.of<TodoProvider>(context, listen: false)
                            .setDone(todo.id, value);
                        }
                      }
                    )
                  ],
                ),
              ),
            ),
          ).toList(),
        );
      },
    );
  }

  Widget searchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
        ),
        child: TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ), 
        ),
      ),
    );
  }

  Widget titleTodo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
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
