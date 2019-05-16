function NotaAtendimento() {

    var pergunta1o = document.atendimento.pergunta1.value.charAt(0);
    var pergunta2o = document.atendimento.pergunta2.value.charAt(0);
    var pergunta3o = document.atendimento.pergunta3.value.charAt(0);
    var pergunta4o = document.atendimento.pergunta4.value.charAt(0);

    var pesottl = 0;
    var peso1 = 0.06;
    var peso2 = 0.05;
    var peso3 = 0.10;
    var peso4 = 0.03;

    pesottl = pergunta1o * peso1;
    pesottl = pesottl + pergunta2o * peso2;
    pesottl = pesottl + pergunta3o * peso3;
    pesottl = pesottl + pergunta4o * peso4;

    document.atendimento.notaatendimento.value = Number(pesottl).toFixed(2)/2;


}