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
        State,
        StatefulWidget,
        Text,
        TextAlign,
        TextEditingController,
        TextFormField,
        Widget;

class FormScreen extends StatefulWidget {
  const FormScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameTask = TextEditingController();
  TextEditingController difficultyTask = TextEditingController();
  TextEditingController imageTask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADICONAR TAREFA'),
      ),
      body: Center(
        child: SingleChildScrollView( // para que ao abrir o teclado por exemplo a tela não "esmage" as coisa, dessa forma ela vai scrollar
          child: Container(
            height: 650,
            width: 375,
            decoration: BoxDecoration(
              color: Colors.black12,
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
                    controller: nameTask,
                    textAlign: TextAlign.center,
                    // para deixar centralizado os inputs
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nome da Tarefa', // placeholder
                        fillColor: Colors.white70,
                        filled:
                            true // basicamente pergunta: voce colocou alguma cor?
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number, // informa que o tipo de conteudo a ser colocado na caixa de texto é um numero
                    controller: difficultyTask,
                    textAlign: TextAlign.center,
                    // para deixar centralizado os inputs
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Dificuldade da Tarefa', // placeholder
                        fillColor: Colors.white70,
                        filled:
                            true // basicamente pergunta: voce colocou alguma cor?
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.url, // informa que o tipo de conteudo a ser colocado na caixa de texto é um url
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
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
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
                    onPressed: () {}, child: const Text('Adicionar Tarefa'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
