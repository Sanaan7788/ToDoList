// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:todolist/add_page.dart';
// import 'package:http/http.dart' as http;

// class TodoListPage extends StatefulWidget {
//   const TodoListPage({super.key});

//   @override
//   State<TodoListPage> createState() => _TodoListPageState();
// }

// class _TodoListPageState extends State<TodoListPage> {
//   List items = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchTodo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Todo List'),
//       ),
//       body: ListView.builder(itemBuilder: (context, index){
// return  ListTitle(
//   title: Text('sample Text'),
// )
//       },)
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: navigateToAddPage,
//         label: const Text('Add Todo'),
//       ),
//     );
//   }

//   void navigateToAddPage() {
//     final route = MaterialPageRoute(
//       builder: (context) => const AddTodoPage(),
//     );
//     Navigator.push(context, route);
//   }

//   Future<void> fetchTodo() async {
//     final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as Map;
//       final result = json['items'] as List;
//       setState(() {
//         items = result;
//       });
//     } else
//       print(response.body);
//   }
// }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:todolist/add_page.dart';
// import 'package:http/http.dart' as http;

// class TodoListPage extends StatefulWidget {
//   const TodoListPage({super.key});

//   @override
//   State<TodoListPage> createState() => _TodoListPageState();
// }

// class _TodoListPageState extends State<TodoListPage> {
//   List items = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchTodo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Todo List'),
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           final item = items[index] as Map;
//           return ListTile(
//             leading: CircleAvatar(child: Text('''
// ${index + 1}''')),
//             title: Text(item['title']),
//             subtitle: Text(item['description']),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: navigateToAddPage,
//         label: const Text('Add Todo'),
//       ),
//     );
//   }

//   void navigateToAddPage() {
//     final route = MaterialPageRoute(
//       builder: (context) => const AddTodoPage(),
//     );
//     Navigator.push(context, route);
//   }

//   Future<void> fetchTodo() async {
//     final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
//     final uri = Uri.parse(url);
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as Map;
//       final result = json['items'] as List;
//       setState(() {
//         items = result;
//       });
//     } else
//       print(response.body);
//   }
// }
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:todolist/add_page.dart';
// import 'package:http/http.dart' as http;

// class TodoListPage extends StatefulWidget {
//   const TodoListPage({super.key});

//   @override
//   State<TodoListPage> createState() => _TodoListPageState();
// }

// class _TodoListPageState extends State<TodoListPage> {
//   bool isLoading = true;
//   List items = [];
//   @override
//   void initState() {
//     super.initState();
//     fetchTodo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var scaffold = Scaffold(
//       appBar: AppBar(
//         title: const Text('Todo List'),
//       ),
//       body: Visibility(
//         visible: isLoading,
//         // ignore: sort_child_properties_last
//         child: Center(child: CircularProgressIndicator()),
//         replacement: RefreshIndicator(
//           onRefresh: fetchTodo,
//           child: ListView.builder(
//             itemCount: items.length,
//             itemBuilder: (context, index) {
//               final item = items[index] as Map;
//               final id = item['_id'] as String;

//               return ListTile(
//                   leading: CircleAvatar(child: Text('${index + 1}')),
//                   title: Text(item['title']),
//                   subtitle: Text(item['description']),
//                   trailing: PopupMenuButton(
//                     onSelected: (value) {
//                       if (value == 'Edit') {
//                       } else if (value == 'Delete') {
//                         deleteById(id);
//                       }
//                     },
//                     itemBuilder: (context) {
//                       return [
//                         const PopupMenuItem(
//                           child: Text('Edit'),
//                           value: 'Edit',
//                         ),
//                         const PopupMenuItem(
//                           value: 'Delete',
//                           child: Text('Delete'),
//                         )
//                       ];
//                     },
//                   ));
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: navigateToAddPage,
//         label: const Text('Add Todo'),
//       ),
//     );
//     return scaffold;
//   }

//   void navigateToAddPage() {
//     final route = MaterialPageRoute(
//       builder: (context) => const AddTodoPage(),
//     );
//     Navigator.push(context, route);
//   }

//   Future<void> deleteById(String id) async {
//     final url = 'https://api.nstack.in/v1/todos/$id';
//     final uri = Uri.parse(url);
//     final response = await http.delete(uri);
//     if (response.statusCode == 200) {
//       final filtered = items.where((element) => element['_id'] != id).toList();
//       setState(() {
//         items = filtered;
//       });
//     } else {
//       showErrorMessage('Deletion is Failed');
//     }

//     Future<void> fetchTodo() async {
//       const url = 'https://api.nstack.in/v1/todos?page=1&limit=20';
//       final uri = Uri.parse(url);
//       final response = await http.get(uri);
//       if (response.statusCode == 200) {
//         final json = jsonDecode(response.body) as Map<String, dynamic>;
//         final result = json['items'] as List<dynamic>;
//         setState(
//           () {
//             items = result.map((e) => e as Map<String, dynamic>).toList();
//           },
//         );
//       }
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   void showSuccessMessage(BuildContext context, String message) {
//     final snackBar = SnackBar(content: Text(message));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

//   void showErrorMessage(String message) {
//     final snackBar = SnackBar(
//       content: Text(
//         message,
//         style: const TextStyle(color: Colors.white),
//       ),
//       backgroundColor: Colors.red,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todolist/add_page.dart';
import 'package:todolist/servies/todo_service.dart';
import 'package:todolist/utilis/snackbar_helper.dart';
import 'package:todolist/widget/todo_card.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  bool isLoading = true;
  List items = [];

  late String message;

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: Visibility(
            visible: items.isNotEmpty,
            replacement: Center(
              child: Text(
                  'Nothing Here for you Please try to be productive for at least once',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index] as Map;

                return TodoCard(
                    index: index,
                    item: item,
                    navigateEdit: navigateToEditPage,
                    deleteById: deleteById);
              },
            ),
          ),
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: const Text('Add Todo'),
      ),
    );
  }

  Future<void> navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(todo: item),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => const AddTodoPage(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> deleteById(String id) async {
    final isSuccess = await TodoService.deleteById(id);
    if (isSuccess) {
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
        showDeleteMessage(context, message: 'Deleted successfully');
      });
    } else {
      showErrorMessage(context,
          message: 'Failed to Delete the Task! Try Again');
    }
  }

  Future<void> fetchTodo() async {
    final response = await TodoService.fetchTodo();

    if (response != null) {
      setState(
        () {
          items = response;
        },
      );
    } else {
      showErrorMessage(context, message: 'something went wrong!');
    }
    setState(() {
      isLoading = false;
    });
  }
}
