import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
final completedItems = <Item>[];

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  @override
  Widget build(BuildContext context) {
     bool hasCompletedTasks = completedItems.isNotEmpty;

    return ListView.separated(
        itemCount: items.length + (hasCompletedTasks ? 1 : 0) + completedItems.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < items.length) {
            return _buildTaskListItem(index);
          } else if (index == items.length && hasCompletedTasks) {
            return const Center(child: Text("Выполненные задачи"));
          } else {
            return _buildCompletedTaskListItem(index - items.length - (hasCompletedTasks ? 1 : 0));
          }
        }, separatorBuilder: (BuildContext context, int index) { 
          return const Divider(
            color: Colors.transparent, // Устанавливаем цвет разделителя как прозрачный
            height: 8,
          );
         },
      );
  }

  Widget _buildTaskListItem(int index) {
    return Slidable(
      key: ValueKey(items[index]),
      startActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () => _performAction(context, index, 'Выполнить'),
        ),
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _performAction(context, index, 'Выполнить'),
            backgroundColor: const Color.fromARGB(199, 18, 215, 94),
            foregroundColor: Colors.white,
            icon: Icons.check_circle,
            label: 'Выполнить',
          ),
        ],
      ),
      endActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () => _performAction(context, index, 'Удалить'),
        ),
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => _performAction(context, index, 'Удалить'),
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
          color: const Color.fromARGB(255, 78, 153, 240),
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
            items[index].name,
            style: addbuttonTextStyle(context),
          ),
          subtitle: Text(
            items[index].description,
            style: TextStyle(fontSize: 15.0, color: Colors.blueGrey[800]) 
          ), 
        trailing: const Icon(
          Icons.access_time,
          color: Colors.black,
          ),
        onTap: () {},
      ),
    )
  );
}

  Widget _buildCompletedTaskListItem(int index) {
    return ListTile(
      title: Text(
        completedItems[index].name,
        style: const TextStyle(decoration: TextDecoration.lineThrough),
      ),
    );
  }

  void _performAction(BuildContext context, int index, String action) {
    final item = items[index];
    setState(() {
      if (action == 'Удалить') {
        items.removeAt(index);
        final snackBar = SnackBar(content: Text('$item удален'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (action == 'Выполнить') {
        completedItems.add(Item(item.name, item.description, item.date, completed: true));
        items.removeAt(index);
        final snackBar = SnackBar(content: Text('$item выполнен'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}



