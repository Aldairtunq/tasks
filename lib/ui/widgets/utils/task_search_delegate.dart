import 'package:flutter/material.dart';
import 'package:tasks/models/task_model.dart';
import 'package:tasks/ui/widgets/item_task_widget.dart';

class TaskSearchDelegate extends SearchDelegate {
  List<TaskModel> tasks;

  TaskSearchDelegate({required this.tasks});

  List<String> names = [
    "juan",
    "luis",
    "carlos",
    "diana",
    "susana",
    "maria",
    "Alejandra",
    "mariela",
    "Angela"
  ];

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "buscar tarea...";
  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => TextStyle(
        fontSize: 18.0,
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<TaskModel> results = tasks
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemTaskWidget(
              taskModel: results[index],
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<TaskModel> results = tasks
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemTaskWidget(
              taskModel: results[index],
            );
          }),
    );
  }
}
