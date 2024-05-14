import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

final items = List.generate(15, (i) => 'Item ${i + 1}');
final completedItems = <String>[];

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  @override
  Widget build(BuildContext context) {
     bool hasCompletedTasks = completedItems.isNotEmpty;

    return  ListView.builder(
        itemCount: items.length + (hasCompletedTasks ? 1 : 0) + completedItems.length,
        itemBuilder: (BuildContext context, int index) {
          if (index < items.length) {
            return _buildTaskListItem(index);
          } else if (index == items.length && hasCompletedTasks) {
            return const Center(child: Text("Выполненные задачи"));
          } else {
            return _buildCompletedTaskListItem(index - items.length - (hasCompletedTasks ? 1 : 0));
          }
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
      child: ListTile(
        title: Text(items[index]),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }

  Widget _buildCompletedTaskListItem(int index) {
    return ListTile(
      title: Text(
        completedItems[index],
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
        completedItems.add(items.removeAt(index));
        final snackBar = SnackBar(content: Text('$item выполнен'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }
}



