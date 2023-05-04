import 'package:flutter/material.dart';
import 'package:projeto_flutter1/components/Tasks.dart';
import 'package:projeto_flutter1/screens/formScreen.dart';
import 'package:projeto_flutter1/data/task_inherited.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('MINHAS TAREFAS'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: taskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ); // MaterialPageRoute = constroi uma nova tela ___ (context) => do contexto de onde estamos para onde vamos
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
