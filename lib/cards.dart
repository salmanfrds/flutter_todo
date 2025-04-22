import 'package:flutter/material.dart';
import './todo.dart';
import './todo_provider.dart';
import 'package:provider/provider.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16.0, left: 16.0, top: 8.0, bottom: 8.0  ),
      decoration: 
        BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            )
          ]
        ),
      height: 100,
      padding: const EdgeInsets.only(left: 16, right:16),
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
          Container(
            width: 100,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              todo.title,
              style: 
                TextStyle(
                  color: Colors.white
                )
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
    );
  }
}