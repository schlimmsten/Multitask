import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:multitask/add_screen_components/data_task/task.dart';
import 'package:multitask/add_screen_components/data_task/task_model.dart';
import 'package:multitask/text_style.dart';

class Item {
  final String name;
  final String description;
  final String date;
  bool completed = false;

  Item(this.name, this.description, this.date, {this.completed = false});
}

final List<Item> items = [
  Item("БЕГИТ", "обязательно", "10:50"),
  Item("Анжумания", "обязательно", "10:50"),
  Item("ПРЭСС качат", "обязательно", "10:50"),
];
final completedItems = <Task>[];

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});
  
  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  final model = TaskModel();
  @override
  Widget build(BuildContext context) {
    return TaskModelProvider(model: model, child: const _TaskListWidgetBody(),);
  }
}

class _TaskListWidgetBody extends StatefulWidget {
  const _TaskListWidgetBody({super.key});

  @override
  State<_TaskListWidgetBody> createState() => __TaskListWidgetBodyState();
}

class __TaskListWidgetBodyState extends State<_TaskListWidgetBody> {
  
  @override
  Widget build(BuildContext context) {
     bool hasCompletedTasks = completedItems.isNotEmpty;
      final countlist = TaskModelProvider.of(context)?.model.tasks.length ?? 0;
      final list = TaskModelProvider.of(context)?.model.tasks;
    return ListView.separated(
        itemCount: countlist + (hasCompletedTasks ? 1 : 0) + completedItems.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < countlist) {
            return _buildTaskListItem(index, list);
          } else if (index == countlist && hasCompletedTasks) {
            return const Center(child: Text("Выполненные задачи"));
          } else {
            return _buildCompletedTaskListItem(index - countlist - (hasCompletedTasks ? 1 : 0));
          }
        }, separatorBuilder: (BuildContext context, int index) { 
          return const Divider(
            color: Colors.transparent, // Устанавливаем цвет разделителя как прозрачный
            height: 8,
          );
         },
      );
  }
  
  Widget _buildTaskListItem(int index, final list) {
    final model = TaskModelProvider.of(context)?.model;
    return Slidable(
      key: ValueKey(list[index]),
      startActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () => _performAction(context, index, 'Выполнить', list),
        ),
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _performAction(context, index, 'Выполнить', list),
            backgroundColor: const Color.fromARGB(199, 18, 215, 94),
            foregroundColor: Colors.white,
            icon: Icons.check_circle,
            label: 'Выполнить',
          ),
        ],
      ),
      endActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () => _performAction(context, index, 'Удалить', list),
        ),
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _performAction(context, index, 'Удалить', list),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Удалить',
          ),
        ],
      ),
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          // color: const Color.fromARGB(255, 78, 153, 240)
          color: model?.tasks[index].color,
          borderRadius: BorderRadius.circular(10), // Форма контейнера
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 2), // Сдвиг тени
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            list[index].name,
            style: addbuttonTextStyle(context),
          ),
          subtitle: Text(
            list[index].description,
            style: TextStyle(fontSize: 15.0, color: Colors.blueGrey[800]) 
          ), 
        trailing: const Icon(
          Icons.access_time,
          color: Colors.black,
          ),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const ChangeScreen()));
        },
      ),
    )
  );
}

  Widget _buildCompletedTaskListItem(int index) {
    final model = TaskModelProvider.of(context)?.model;
    return ListTile(
      title: Text(
        completedItems[index].name,
        style: const TextStyle(decoration: TextDecoration.lineThrough),
      ),
    );
  }

  void _performAction(BuildContext context, int index, String action, final list) {
    final item = list[index].name;
    final model = TaskModelProvider.of(context)?.model;
    setState(() {
      if (action == 'Удалить') {
        model?.deleteItemBox(index);
        final snackBar = SnackBar(content: Text('$item удален'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (action == 'Выполнить') {
        completedItems.add(model!.tasks[index]);
        model.deleteItemBox(index);
        final snackBar = SnackBar(content: Text('$item выполнен'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}


