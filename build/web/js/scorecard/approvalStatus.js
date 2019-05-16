function approvalStatus(criacao, planejamento, locale) {

    var notafinal = document.getElementById('notafinal').value;


    if (notafinal <= 1.99) {

        if (locale === "pt") {
            document.getElementById('approvalStatus').value = "Alto Risco, deve ser RECUSADO";

        } else {
            document.getElementById('approvalStatus').value = "High Risk, must be REFUSED";

        }
    } else if (notafinal >= 2.0 && notafinal <= 2.99) {

        if (criacao === true && planejamento === true) {

            var pergunta1 = document.getElementById('pergunta1').value.charAt(0);
            var pergunta4 = document.getElementById('pergunta4').value.charAt(0);
            var pergunta8 = document.getElementById('pergunta8').value.charAt(0);
            var pergunta12cri = document.getElementById('pergunta12cri').value.charAt(0);
            var pergunta16operacao = document.getElementById('pergunta16operacao').value.charAt(0);
            var pergunta12plan = document.getElementById('pergunta12plan').value.charAt(0);
            var pergunta16atendimento = document.getElementById('pergunta16atendimento').value.charAt(0);

            var pergunta12 = (parseInt(pergunta12cri) + parseInt(pergunta12plan)) / 2;
            var pergunta16 = (parseInt(pergunta16operacao) + parseInt(pergunta16atendimento)) / 2;

            var notas = [pergunta1, pergunta4, pergunta8, pergunta12, pergunta16];

            var aprovado = 0;

            for (var i = 0; i < notas.length; i++) {

                if (notas[i] >= 4 || notas[i] >= 5) {
                    aprovado++;
                }
            }

            if (aprovado >= 3) {
                if (locale === "pt") {

                    document.getElementById('approvalStatus').value = "Risco Médio, deve ser APROVADO pelo critério de desempate";
                } else {
                    document.getElementById('approvalStatus').value = "Average Risk, must be APPROVED using the tiebreaker";

                }
            } else {
                if (locale === "pt") {

                    document.getElementById('approvalStatus').value = "Risco Médio, deve ser RECUSADO pelo critério de desempate";
                } else {
                    document.getElementById('approvalStatus').value = "Average Risk, must be REFUSED using the tiebreaker";

                }
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
            var pergunta14atendimento = document.getElementById('pergunta14atendimento');
            if (pergunta14atendimento !== null) {
                pergunta14atendimento = pergunta14atendimento.value.charAt(0);
            } else {
                pergunta14atendimento = 0;
            }
            var pergunta16operacao = document.getElementById('pergunta16operacao');
            if (pergunta16operacao !== null) {
                pergunta16operacao = pergunta16operacao.value.charAt(0);
            } else {
                pergunta16operacao = 0;
            }
            var pergunta16atendimento = document.getElementById('pergunta16atendimento');
            if (pergunta16atendimento !== null) {
                pergunta16atendimento = pergunta16atendimento.value.charAt(0);
            } else {
                pergunta16operacao = 0;
            }
            var pergunta14 = (parseInt(pergunta14operacao) + parseInt(pergunta14atendimento)) / 2;
            var pergunta16 = (parseInt(pergunta16operacao) + parseInt(pergunta16atendimento)) / 2;

            var notas = [pergunta1, pergunta4, pergunta14, pergunta16];

            var aprovado = 0;

            for (var i = 0; i < notas.length; i++) {

                if (notas[i] >= 4 || notas[i] >= 5) {
                    aprovado++;
                }
            }
            if (aprovado >= 1) {

                if (locale === "pt") {

                    document.getElementById('approvalStatus').value = "Risco Médio, deve ser APROVADO pelo critério de desempate";
                } else {
                    document.getElementById('approvalStatus').value = "Average Risk, must be APPROVED using the tiebreaker";

                }
            } else {

                if (locale === "pt") {

                    document.getElementById('approvalStatus').value = "Risco Médio, deve ser RECUSADO pelo critério de desempate";
                } else {
                    document.getElementById('approvalStatus').value = "Average Risk, must be REFUSED using the tiebreaker";

                }
            }


        }


    } else if (notafinal >= 3.0 && notafinal <= 3.99) {

        if (locale === "pt") {

            document.getElementById('approvalStatus').value = "Bom Potencial, deve ser APROVADO";
        } else {
            document.getElementById('approvalStatus').value = "Good Potential, must be APPROVED";

        }
    } else if (notafinal >= 4.0) {
        if (locale === "pt") {

            document.getElementById('approvalStatus').value = "Alto Potencial, deve ser APROVADO e tratado com prioridade";
        } else {
            document.getElementById('approvalStatus').value = "High Potential, must be APPROVED with priority";

        }
    }


}