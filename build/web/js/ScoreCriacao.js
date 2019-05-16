function NotaCriacao() {
    
    var pergunta1p = document.criacao.pergunta1.value.charAt(0);
    var pergunta2p = document.criacao.pergunta2.value.charAt(0);
    var pergunta3p = document.criacao.pergunta3.value.charAt(0);
    
    var pesottl = 0;
    var peso1 = 0.08;
    var peso2 = 0.06;
    var peso3 = 0.06;

    pesottl = pergunta1p * peso1;
    pesottl = pesottl + pergunta2p * peso2;
    pesottl = pesottl + pergunta3p * peso3;
    
    pergunta1p = null;
    pergunta2p = null;
    pergunta3p = null;

    document.criacao.notacriacao.value = Number(pesottl).toFixed(2)/2;


}