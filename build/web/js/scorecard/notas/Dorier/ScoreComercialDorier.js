function NotaComercialDorier() {
    
    var pergunta1c = document.comercial.pergunta1.value.charAt(0);
    var pergunta2c = document.comercial.pergunta2.value.charAt(0);
    var pergunta3c = document.comercial.pergunta3.value.charAt(0);
    var pergunta4c = document.comercial.pergunta4.value.charAt(0);
    var pergunta5c = document.comercial.pergunta5.value.charAt(0);
    var pergunta6c = document.comercial.pergunta6.value.charAt(0);
    var pergunta7c = document.comercial.pergunta7.value.charAt(0);
    var pergunta8c = document.comercial.pergunta8.value.charAt(0);
    var pergunta9c = document.comercial.pergunta9.value.charAt(0);
    var pergunta10c = document.comercial.pergunta10.value.charAt(0);


    var pesottl = 0;
    var peso1 = 0.09;
    var peso2 = 0.03;
    var peso3 = 0.05;
    var peso4 = 0.08;
    var peso5 = 0.05;
    var peso6 = 0.05;
    var peso7 = 0.05;
    var peso8 = 0.08;
    var peso9 = 0.03;
    var peso10 = 0.05;

    pesottl = pergunta1c * peso1;
    pesottl = pesottl + pergunta2c * peso2;
    pesottl = pesottl + pergunta3c * peso3;
    pesottl = pesottl + pergunta4c * peso4;
    pesottl = pesottl + pergunta5c * peso5;
    pesottl = pesottl + pergunta6c * peso6;
    pesottl = pesottl + pergunta7c * peso7;
    pesottl = pesottl + pergunta8c * peso8;
    pesottl = pesottl + pergunta9c * peso9;
    pesottl = pesottl + pergunta10c * peso10;
    
    pergunta1c = null;
    pergunta2c = null;
    pergunta3c = null;
    pergunta4c = null;
    pergunta5c = null;
    pergunta6c = null;
    pergunta7c = null;
    pergunta8c = null;
    pergunta9c = null;
    pergunta10c = null;
        
    document.comercial.notacomercial.value = Number(pesottl).toFixed(2);


}