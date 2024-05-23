import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:multitask/add_screen_components/data_task/task.dart';
import 'package:multitask/add_screen_components/data_task/task_model.dart';
import 'package:multitask/screens/change_screen.dart';
import 'package:multitask/settings_screen_components/line.dart';
import 'package:multitask/text_style.dart';
import 'package:provider/provider.dart'; // Импорт Provider

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(
      // Использование Consumer для доступа к TaskModel
      builder: (context, model, child) {
        final completedTasks = model.completedtasks;
        final tasks = model.tasks;
        final hasCompletedTasks = completedTasks.isNotEmpty;
        if (tasks.isEmpty && !hasCompletedTasks) {
          return Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            const Text("Задач на текущий день нет...")
          ]);
        }
        return ListView.separated(
          itemCount: tasks.length +
              (hasCompletedTasks ? 1 : 0) +
              completedTasks.length,
          itemBuilder: (BuildContext context, int index) {
            if (index < tasks.length) {
              return _buildTaskListItem(context, index, tasks);
            } else if (index == tasks.length && hasCompletedTasks) {
              return _buildCompletedTasksSection(context, tasks);
            } else {
              return _buildCompletedTaskListItem(
                  context, index - tasks.length - (hasCompletedTasks ? 1 : 0));
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.transparent,
              height: 8,
            );
          },
        );
      },
    );
  }

  Widget _buildTaskListItem(BuildContext context, int index, List<Task> list) {
    final model = Provider.of<TaskModel>(
        context); // Использование Provider.of для доступа к модели
    return Slidable(
      key: ValueKey(list[index]),
      startActionPane: ActionPane(
        dismissible: DismissiblePane(
          onDismissed: () => _performAction(context, index, 'Выполнить', list),
        ),
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) =>
                _performAction(context, index, 'Выполнить', list),
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
            onPressed: (context) =>
                _performAction(context, index, 'Удалить', list),
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
          color: model.tasks[index].color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            list[index].category,
            style: descriptionTextStyle(context),
          ),
          subtitle: Text(
            list[index].name,
            style: nameTaskTextStyle(context),
          ),
          trailing: Column(
            children: [
              const Icon(Icons.access_time),
              Text(
                list[index].selectedTime,
                style: selectedTimeTextStyle(context),
              ),
            ],
          ),
          // Text(
          //   list[index].selectedTime,
          //   style: selectedTimeTextStyle(context)
          //   ),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ChangeScreen(index: index)));
          },
        ),
      ),
    );
  }

  Widget _buildCompletedTasksSection(BuildContext context, List<Task> tasks) {
    final model = Provider.of<TaskModel>(context);
    return Column(children: [
      if(tasks.isNotEmpty)
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      if(tasks.isNotEmpty)
        const Line(),
      if(tasks.isNotEmpty)
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text("Выполненные задачи"),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        FloatingActionButton(
          heroTag: 'clearCompletedTasks',
          onPressed: () {
            model.clearCompletedTasks();
            const snackBar =
                SnackBar(content: Text('Список выполненных задач очищен'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.delete,
              color: Theme.of(context).appBarTheme.backgroundColor),
        ),
      ]),
    ]);
  }

  Widget _buildCompletedTaskListItem(BuildContext context, int index) {
    final model = Provider.of<TaskModel>(context);
    final completedTasks = model.completedtasks;
    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: colorSelectedTasks(context),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          completedTasks[index].name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ),
    );
  }

  void _performAction(
      BuildContext context, int index, String action, List<Task> list) {
    final model = Provider.of<TaskModel>(context, listen: false);

    final item = list[index];

    if (action == 'Удалить') {
      model.deleteItemBox(item);
      list.removeAt(index);
      final snackBar = SnackBar(content: Text('${item.name} удален'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (action == 'Выполнить') {
      model.updateTaskStatus(item, true);
      final snackBar = SnackBar(content: Text('${item.name} выполнен'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
