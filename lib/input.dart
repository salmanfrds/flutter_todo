import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './todo_provider.dart';

class InputNew extends StatefulWidget {

  const InputNew({super.key});

  @override
  State<InputNew> createState() => _InputNewState();
}

class _InputNewState extends State<InputNew> {
  final TextEditingController _addController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: Offset(4, 4),
                ) // Shadow position
              ]
            ),
            child: TextField(
              controller: _addController,
              decoration: InputDecoration(
                hintText: 'Enter Todo',
                suffix: IconButton(
                  onPressed: () {
                    context.read<TodoProvider>().inputTodo(_addController.text);
                    _addController.clear();
                  }, 
                  icon: Icon(Icons.add)
                )
              ), 
            ),
          ),
        ),
      ],
    );
  }
}