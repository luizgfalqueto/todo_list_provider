import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';

import '../../../models/task_model.dart';

class Task extends StatelessWidget {
  final TaskModel model;
  final dateFormat = DateFormat('dd/MM/y');
  Task({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.read<HomeController>().delete(model);
            },
            autoClose: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.red,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.grey),
            ]),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: IntrinsicHeight(
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: Checkbox(
              onChanged: (value) {
                context.read<HomeController>().checkOrUncheckTask(model);
              },
              value: model.finished,
            ),
            title: Text(
              model.description,
              style: TextStyle(
                decoration: model.finished ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              dateFormat.format(model.dateTime),
              style: TextStyle(
                decoration: model.finished ? TextDecoration.lineThrough : null,
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  width: 1,
                )),
          ),
        ),
      ),
    );
  }
}
