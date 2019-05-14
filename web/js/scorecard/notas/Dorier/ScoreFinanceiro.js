function NotaFinanceiro() {

    var pergunta1 = document.financeiro.pergunta1.value.charAt(0);
    var pergunta2 = document.financeiro.pergunta2.value.charAt(0);
    var pergunta3 = document.financeiro.pergunta3.value.charAt(0);
    //var pergunta4 = document.financeiro.pergunta4.value.charAt(0);

    var pesottl = 0;
    var peso1 = 0.06;
    var peso2 = 0.05;
    var peso3 = 0.10;
    //var peso4 = 0.03;

    pesottl = pergunta1 * peso1;
    pesottl = pesottl + pergunta2 * peso2;
    pesottl = pesottl + pergunta3 * peso3;
   // pesottl = pesottl + pergunta4 * peso4;

    document.financeiro.notafinanceiro.value = Number(pesottl).toFixed(2)/2;


}