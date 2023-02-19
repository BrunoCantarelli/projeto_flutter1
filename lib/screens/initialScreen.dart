import 'package:flutter/material.dart';
import 'package:projeto_flutter1/components/Tasks.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const Text('MINHAS TAREFAS'),
        ),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 800),
          child: ListView(children: const [
            Task('Aprender Flutter', 'assets/images/flutterImg.png', 4),
            Task('Aprender Dart', 'assets/images/dartImg.png', 4),
            Task('Jogar Tênis', 'assets/images/tennisImg.jpg', 3),
            Task('Descanso', 'assets/images/descansoImg.jpg', 2),
            Task('Gabi', 'assets/images/gabiImg.jpeg', 5),
            SizedBox(
              height: 80,
            )
            // para o botão n ficar em cima do nivel do ultimo card
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              // setState "fica de olho" se houver alguma mudança
              opacidade = !opacidade;
            });
          },
          child: const Icon(Icons.remove_red_eye),
        ));
  }
}
