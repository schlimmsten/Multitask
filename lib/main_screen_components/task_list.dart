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
              height: 10,
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
        height: 90,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: model?.tasks[index].color?.withOpacity(0.5) ?? Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  list[index].category,
                  style: descriptionTextStyle(context,model.tasks[index].color),
                ),
                subtitle: Text(
                  list[index].name,
                  style: nameTaskTextStyle(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => ChangeScreen(index: index)),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 2.9,
                height: 70.0,
                color: colorLine(context, model.tasks[index].color),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SizedBox(
                width: 70,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time,
                      color: colorTime(context),
                    ),
                    Text(
                      list[index].selectedTime,
                      style: selectedTimeTextStyle(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedTasksSection(BuildContext context, List<Task> tasks) {
    final model = Provider.of<TaskModel>(context);
    return Column(children: [
      if (tasks.isNotEmpty)
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
      if (tasks.isNotEmpty) const Line(),
      if (tasks.isNotEmpty)
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.07,
            child: ElevatedButton(
              onPressed: () {
                model.clearCompletedTasks();
                const snackBar =
                    SnackBar(content: Text('Список выполненных задач очищен'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.delete, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Очистить выполненные задачи',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      ),
                    
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        ],
      ),
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
        title: RichText(
          text: TextSpan(
            text: completedTasks[index].name,
            style: combinedStyle(context)
                .merge(const TextStyle(decorationThickness: 3.0)),
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
