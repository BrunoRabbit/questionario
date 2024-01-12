import 'package:flutter/material.dart';
import 'package:questionario/components/Resposta.dart';
import 'package:questionario/entity/questionario.dart';
import '../components/Questao.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Questionario questionario;

  @override
  void initState() {
    super.initState();
    questionario = Questionario([
      {
        'texto': 'Qual seu animal favorito? ',
        'resposta': ['Girafa', 'Elefante', 'Macaco', 'Tartaruga'],
        'nota': [10, 7, 5, 2]
      },
      {
        'texto': 'Qual sua cor favorita?',
        'resposta': ['Verde', 'Azul', 'Amarelo', 'Preto'],
        'nota': [10, 7, 5, 2]
      },
      {
        'texto': 'Qual sua linguagem favorita?',
        'resposta': ['java', 'Dart', 'javascript', 'python'],
        'nota': [10, 7, 5, 2]
      },
    ]);
  }

  _responder() {
    setState(() {
      questionario.responder();
    });
  }

  _reiniciarQuestionario() {
    setState(() {
      questionario.reiniciarQuestionario();
    });
  }

  get numQuestao => questionario.numQuestao;
  get questao => questionario.questao[numQuestao];
  get perguntaSelecionada => questionario.perguntaSelecionada;
  get resposta => questionario.respostaAtual;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionário'),
      ),
      body: perguntaSelecionada
          ? Column(
            children: [
              Questao(questao['texto'].toString()),
              ...resposta.map((e) => Resposta(e, _responder)).toList(),
            ],
          )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    child: Text('Refazer o teste'),
                    onPressed: _reiniciarQuestionario,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                const Text(''),
              ],
            ),
    );
  }
}
