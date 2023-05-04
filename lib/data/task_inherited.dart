// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:projeto_flutter1/components/Tasks.dart';

class taskInherited extends InheritedWidget {
  // para funcionar ele precisa ser pai de todos os widget, ou seja, precisamos add ele na main
  taskInherited({
    Key? key,
    required Widget child, // requer obrigatoriamente um child
  }) : super(key: key, child: child);

// criou uma lista de task
  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/flutterImg.png', 4),
    Task('Aprender Dart', 'assets/images/dartImg.png', 4),
    Task('Jogar Tênis', 'assets/images/tennisImg.jpg', 3),
    Task('Descanso', 'assets/images/descansoImg.jpg', 2),
    Task('Gabi', 'assets/images/gabiImg.jpeg', 5),
  ];

  // uma função para preencher a task
  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty));
  }

  static taskInherited of(BuildContext context) {
    final taskInherited? result =
        context.dependOnInheritedWidgetOfExactType<taskInherited>();
    assert(result != null, 'No taskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(taskInherited oldWidget) {
    // updateShouldNotify é quem fica de olho na nossa aplicação, mas no caso, no estado anterior
    return oldWidget.taskList.length !=
        taskList
            .length; // "o estado anterior da lista é difente do atual estado da lista?"
  }
}
