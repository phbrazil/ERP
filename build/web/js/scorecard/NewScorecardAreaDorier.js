function NewScorecardAreaDorier() {

    var operacao = document.getElementById('operacaoBox').checked;
    var finaceiro = document.getElementById('financeiroBox').checked;


    if (operacao === false) {

        document.getElementById('operacaoEmail').disabled = true;

    } else {
        document.getElementById('operacaoEmail').disabled = false;

    }

    if (finaceiro === false) {
        document.getElementById('financeiroEmail').disabled = true;

    } else {
        document.getElementById('financeiroEmail').disabled = false;

    }


}

function validaSelecao() {

    var score = document.getElementsByName('newScore');

    var operacao = document.getElementById('operacaoBox').checked;
    var financeiro = document.getElementById('financeiroBox').checked;

    if (operacao === false && financeiro === false) {
        alert("<br><strong>Ao menos uma área deve ser selecionada para continuar</strong>");
        return false;

    } else {
        score.submit();

    }

}
