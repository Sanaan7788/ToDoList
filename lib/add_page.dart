// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todolist/servies/todo_service.dart';
import 'package:todolist/utilis/snackbar_helper.dart';

class AddTodoPage extends StatefulWidget {
  final Map? todo;
  const AddTodoPage({
    super.key,
    this.todo,
  });

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isEdit = false;

  get id => null;
  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      titleController.text = todo['title'];
      descriptionController.text = todo['description'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              isEdit ? 'Edit Todo' : 'Add Todo',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(hintText: 'Title'),
                  controller: titleController,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(hintText: 'Description'),
                  keyboardType: TextInputType.multiline,
                  minLines: 5,
                  maxLines: 8,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: isEdit ? updateData : submitData,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(isEdit ? 'Update' : 'Submit'),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> updateData() async {
    final todo = widget.todo;

    final id = todo?['_id'];
    final isSucess = await TodoService.updateTodo(id, body);
    if (isSucess) {
      showSuccessMessage(context, message: "Updated Task Successfully");
    } else {
      showErrorMessage(context, message: "Failed to Update task");
    }
  }

  Future<void> submitData() async {
    final title = titleController.text;
    final description = descriptionController.text;

    if (title.isEmpty || description.isEmpty) {
      showErrorMessage(context, message: "Please fill in all fields");
      return;
    }

    final messageUpdate = await TodoService.addTodo(body);
    if (messageUpdate) {
      showErrorMessage(context, message: "Failed to create task");
    } else {
      // ignore: duplicate_ignore
      // ignore: use_build_context_synchronously
      titleController.clear();
      descriptionController.clear();
      showSuccessMessage(context, message: "Task Created");
    }
  }

  Map get body {
    final title = titleController.text;
    final description = descriptionController.text;

    return {
      "title": title,
      "description": description,
      "is_completed": false,
    };
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
