import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BoxFit,
        BuildContext,
        ClipRRect,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        ElevatedButton,
        Icon,
        Icons,
        Image,
        Key,
        LinearProgressIndicator,
        MainAxisAlignment,
        Padding,
        Row,
        SizedBox,
        Stack,
        State,
        StatefulWidget,
        Text,
        TextOverflow,
        TextStyle,
        Widget;
import 'package:projeto_flutter1/components/difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  int nivel = 0; // variavel do nivel de cada task

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int maestryLevel = 1;

  bool assetOrNetwork() {
    if (widget.foto.contains('htpps')) {
      // se widget de foto conter 'htpp' retorna false
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: (maestryLevel == 1)
                  ? Colors.blue
                  : (maestryLevel == 2)
                      ? Colors.green
                      : (maestryLevel == 3)
                          ? Colors.yellow
                          : (maestryLevel == 4)
                              ? Colors.purple
                              : (maestryLevel == 5)
                                  ? Colors.red
                                  : (maestryLevel == 6)
                                      ? Colors.orange
                                      : (maestryLevel == 7)
                                          ? Colors.grey
                                          : Colors.white,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white60,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.foto,
                                fit: BoxFit
                                    .cover, // ajusta a imagem de forma certa dentro do espaço proposto
                              )
                            : Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: const TextStyle(fontSize: 24),
                            overflow: TextOverflow
                                .ellipsis, // caso o texto seja maior que card, aparece '...'
                          ),
                        ),
                        Difficulty(
                          difficultyLevel: widget.dificuldade,
                        )
                        // recebe o parâmetro
                      ],
                    ),
                    SizedBox(
                      height: 52, // para arrumar o tamanho do botão
                      width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                widget.nivel++;
                                if (widget.nivel / widget.dificuldade > 10) {
                                  maestryLevel++;
                                  if (maestryLevel <= 7) {
                                    widget.nivel = 1;
                                  }
                                }
                              },
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP!',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        // Linha de progresso dos niveis
                        color: (maestryLevel == 2)
                            ? Colors.purple
                            : (maestryLevel == 3)
                                ? Colors.pinkAccent
                                : (maestryLevel == 4)
                                    ? Colors.black
                                    : (maestryLevel == 5)
                                        ? Colors.green
                                        : (maestryLevel == 6)
                                            ? Colors.deepPurpleAccent
                                            : (maestryLevel == 7)
                                                ? Colors.red
                                                : Colors.white,
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Nivel: ${widget.nivel}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
