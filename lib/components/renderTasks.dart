import 'package:flutter/material.dart';
import '../services/task.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
  final title;
  final userId;
  Task({this.title, this.userId});
}

class _TaskState extends State<Task> {
  final tasksService = new TaskService();
  List tasks = [];
  @override
  void initState() {
    super.initState();
    _setTasksState();
  }

  _setTasksState() async {
    var tasksOfUser = await tasksService.getTasksOfUser(widget.userId);
    setState(() {
      tasks = tasksOfUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            String title = tasks[index].title;
            String description = tasks[index].description;
            bool taskDone = tasks[index].done;
            return Card(
              child: ListTile(
                leading: Icon(
                  taskDone ? Icons.done : Icons.clear,
                  color: taskDone ? Colors.green : Colors.red,
                ),
                dense: true,
                title: Text(title),
                subtitle: Text(description),
              ),
            );
          },
        ),
      ),
    );
  }
}

// class RenderTasks extends StatelessWidget {
//   RenderTasks({this.function, this.deleteFunction});
//   final Function function;
//   final Function deleteFunction;
//   var taskId;

//   Future<ConfirmAction> _asyncConfirmDialog(
//       BuildContext context, String title, String id) async {
//     return showDialog<ConfirmAction>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             'Deseja apagar a task: ${title} ?',
//             style: TextStyle(fontSize: 12.0),
//           ),
//           actions: <Widget>[
//             FlatButton(
//               child: const Text('Cancelar'),
//               onPressed: () {
//                 Navigator.of(context).pop(ConfirmAction.CANCEL);
//               },
//             ),
//             FlatButton(
//               child: const Text('Apagar'),
//               onPressed: () {
//                 deleteFunction(id);
//                 Navigator.of(context).pop(ConfirmAction.ACCEPT);
//               },
//             )
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: function(),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
// if (snapshot.data == null) {
//   return Container(
//     child: Center(child: new CircularProgressIndicator()),
//   );
// }
// return ListView.builder(
//   itemCount: snapshot.data.length,
//   itemBuilder: (BuildContext context, int index) {
//     String title = snapshot.data[index].title;
//     String description = snapshot.data[index].description;
//     String id = snapshot.data[index].id;
//     return RefreshIndicator(
//       child: Card(
//         child: ListTile(
//           dense: true,
//           title: Text(title),
//           subtitle: Text(description),
//           onLongPress: () {
//             _asyncConfirmDialog(context, title, id);
//           },
//         ),
//       ),
//       onRefresh: function,
//     );
//   },
// );
//         });
//   }
// }
