// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        Border,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Center,
        Colors,
        Column,
        Container,
        EdgeInsets,
        ElevatedButton,
        InputDecoration,
        Key,
        OutlineInputBorder,
        Padding,
        Scaffold,
        ScaffoldMessenger,
        SnackBar,
        State,
        StatefulWidget,
        Text,
        TextAlign,
        TextEditingController,
        TextFormField,
        Widget;
import 'package:projeto_flutter1/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameTask = TextEditingController();
  TextEditingController difficultyTask = TextEditingController();
  TextEditingController imageTask = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidador(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidador(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 5 || int.parse(value) > 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // cria um widget form que pega o scaffold para poder fazer validações
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ADICIONAR TAREFA'),
        ),
        body: Center(
          child: SingleChildScrollView(
            // para que ao abrir o teclado por exemplo a tela não "esmage" as coisa, dessa forma ela vai scrollar
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 3,
                  color: Colors.deepPurple,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidador(value)) {
                          return 'Insira um nome para a tarefa!';
                        }
                        return null;
                      },
                      controller: nameTask,
                      textAlign: TextAlign.center,
                      // para deixar centralizado os inputs
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome', // placeholder
                        fillColor: Colors.white70,
                        filled:
                            true, // basicamente pergunta: voce colocou alguma cor?
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (difficultyValidador(value)) {
                          return 'Insira uma dificuldade entre 1 e 5!';
                        }
                        return null; // indica que não precisa fazer nada
                      },
                      keyboardType: TextInputType.number,
                      // informa que o tipo de conteudo a ser colocado na caixa de texto é um numero
                      controller: difficultyTask,
                      textAlign: TextAlign.center,
                      // para deixar centralizado os inputs
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Dificuldade', // placeholder
                          fillColor: Colors.white70,
                          filled:
                              true // basicamente pergunta: voce colocou alguma cor?
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (valueValidador(value)) {
                          // .isEmpty = se tiver vazia
                          return 'Insira uma url de imagem!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      // informa que o tipo de conteudo a ser colocado na caixa de texto é um url
                      onChanged: (text) {
                        setState(() {
                          // setState para avisar que a imagem foi alterada
                        });
                      },
                      controller: imageTask,
                      textAlign: TextAlign.center,
                      // para deixar centralizado os inputs
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Imagem', // placeholder
                          fillColor: Colors.white70,
                          filled:
                              true // basicamente pergunta: voce colocou alguma cor?
                          ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      // ClipRRect usado para criar cantos arredondados em imagens, contêineres, botões e outros elementos.
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        // para exibir imagens da web
                        imageTask.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? StackTrace) {
                          // para tirar o "X" quando a imagem está com erro
                          return Image.asset(
                              "assets/images/nophoto.png"); // imagem que fica quando da algum erro
                        }, // é uma saida para caso de uma erro na imagem
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      // o ElevatedButton esta vinculado ao GlobalKey do Form
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // se o estado atual (do formulario) for valido
                          taskInherited.of(widget.taskContext).newTask(
                              nameTask.text,
                              imageTask.text,
                              int.parse(difficultyTask.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Salvando nova tarefa...'),
                            ),
                          );
                          Navigator.pop(
                              context); // usado para remover a rota atual da pilha de rotas do aplicativo e retornar à tela anterior na pilha
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'ERRO! Preencha os campos adequadamente!',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Adicionar Tarefa'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
