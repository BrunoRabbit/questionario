import 'dart:html';

import 'package:flutter/material.dart';
import 'package:questionario/components/Resposta.dart';

import 'components/Questao.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numQuestao = 0;
  int pontuacao = 0;
  dynamic pontos;
  final List<Map<String, Object>> questao = const [
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
  ];

  void _responder() {
    if (perguntaSelecionada) {
      setState(() {
        numQuestao++;
        pontuacao++;
      });
    }
  }

  bool get perguntaSelecionada {
    return numQuestao < questao.length;
  }

  void reiniciarQuestionario() {
    setState(() {
      numQuestao = 0;
      pontuacao = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    dynamic resposta =
        perguntaSelecionada ? questao[numQuestao].cast()['resposta'] : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: perguntaSelecionada
          ? Center(
              child: Column(
                children: [
                  Questao(questao[numQuestao]['texto'].toString()),
                  ...resposta.map((e) => Resposta(e, _responder)).toList(),
                ],
              ),
            )
          : Row(
              children: [
                Center(
                  child: ElevatedButton(
                    child: Text('Clique aqui para Refazer o teste'),
                    onPressed: reiniciarQuestionario,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(''),
              ],
            ),
    );
  }
}
