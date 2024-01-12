class Questionario {
  int numQuestao = 0;
  int pontuacao = 0;
  dynamic pontos;

  Questionario(this.questao);

  final List<Map<String, Object>> questao;

  bool get perguntaSelecionada {
    return numQuestao < questao.length;
  }

  dynamic get respostaAtual {
    return perguntaSelecionada ? questao.cast()[numQuestao]['resposta'] : null;
  }

  void responder() {
    if (perguntaSelecionada) {
      numQuestao++;
      pontuacao++;
    }
  }

  void reiniciarQuestionario() {
    numQuestao = 0;
    pontuacao = 0;
  }
}
