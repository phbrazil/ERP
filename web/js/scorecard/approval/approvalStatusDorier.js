function approvalStatusDorier(operacao, financeiro) {

    var notafinal = document.getElementById('notafinal').value;


    if (notafinal <= 1.99) {
        document.getElementById('approvalStatus').value = "Alto Risco, deve ser RECUSADO";
    } else if (notafinal >= 2.0 && notafinal <= 2.99) {

        if (operacao === true && financeiro === true) {

            var pergunta1 = document.getElementById('pergunta1').value.charAt(0);
            var pergunta4 = document.getElementById('pergunta4').value.charAt(0);
            var pergunta8 = document.getElementById('pergunta8').value.charAt(0);
            var pergunta16operacao = document.getElementById('pergunta16operacao').value.charAt(0);
            var pergunta16financeiro = document.getElementById('pergunta16financeiro').value.charAt(0);

            var pergunta12 = (parseInt(pergunta16operacao) + parseInt(pergunta16operacao)) / 2;
            var pergunta16 = (parseInt(pergunta16financeiro) + parseInt(pergunta16financeiro)) / 2;

            var notas = [pergunta1, pergunta4, pergunta8, pergunta12, pergunta16];

            var aprovado = 0;

            for (var i = 0; i < notas.length; i++) {

                if (notas[i] >= 4 || notas[i] >= 5) {
                    aprovado++;
                }
            }

            if (aprovado >= 3) {
                document.getElementById('approvalStatus').value = "Risco Médio, deve ser APROVADO pelo critério de desempate";

            } else {
                document.getElementById('approvalStatus').value = "Risco Médio, deve ser RECUSADO pelo critério de desempate";

            }

        } else {

            var pergunta1 = document.getElementById('pergunta1').value.charAt(0);
            var pergunta4 = document.getElementById('pergunta4').value.charAt(0);


            var pergunta14operacao = document.getElementById('pergunta14operacao');
            if (pergunta14operacao !== null) {
                pergunta14operacao = pergunta14operacao.value.charAt(0);
            } else {
                pergunta14operacao = 0;
            }

            var pergunta16operacao = document.getElementById('pergunta16operacao');
            if (pergunta16operacao !== null) {
                pergunta16operacao = pergunta16operacao.value.charAt(0);
            } else {
                pergunta16operacao = 0;
            }

            var pergunta14 = (parseInt(pergunta14operacao) + parseInt(pergunta16operacao)) / 2;
            var pergunta16 = (parseInt(pergunta16operacao) + parseInt(pergunta16operacao)) / 2;

            var notas = [pergunta1, pergunta4, pergunta14, pergunta16];

            var aprovado = 0;

            for (var i = 0; i < notas.length; i++) {

                if (notas[i] >= 4 || notas[i] >= 5) {
                    aprovado++;
                }
            }
            if (aprovado >= 1) {
                document.getElementById('approvalStatus').value = "Risco Médio, deve ser APROVADO pelo critério de desempate";

            } else {
                document.getElementById('approvalStatus').value = "Risco Médio, deve ser RECUSADO pelo critério de desempate";

            }


        }


    } else if (notafinal >= 3.0 && notafinal <= 3.99) {
        document.getElementById('approvalStatus').value = "Bom Potencial, deve ser APROVADO";

    } else if (notafinal >= 4.0) {
        document.getElementById('approvalStatus').value = "Alto Potencial, deve ser APROVADO e tratado com prioridade";

    }


}