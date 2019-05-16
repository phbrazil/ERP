function NewScorecardArea() {

    var operacao = document.getElementById('operacaoBox').checked;
    var atendimento = document.getElementById('atendimentoBox').checked;
    var criacao = document.getElementById('criacaoBox').checked;
    var planejamento = document.getElementById('planejamentoBox').checked;


    if (operacao === false) {

        document.getElementById('operacaoEmail').disabled = true;

    } else {
        document.getElementById('operacaoEmail').disabled = false;

    }
    if (atendimento === false) {
        document.getElementById('atendimentoEmail').disabled = true;

    } else {
        document.getElementById('atendimentoEmail').disabled = false;

    }
    if (criacao === false) {
        document.getElementById('criacaoEmail').disabled = true;

    } else {
        document.getElementById('criacaoEmail').disabled = false;

    }
     if (planejamento === false) {
        document.getElementById('planejamentoEmail').disabled = true;

    } else {
        document.getElementById('planejamentoEmail').disabled = false;

    }
    

}

function validaSelecao() {

    var score = document.getElementsByName('newScore');

    var operacao = document.getElementById('operacaoBox').checked;
    var atendimento = document.getElementById('atendimentoBox').checked;
    var criacao = document.getElementById('criacaoBox').checked;
    var planejamento = document.getElementById('planejamentoBox').checked;

    if (operacao === false && atendimento === false && criacao === false && planejamento === false) {
        alert("<br><strong>Ao menos uma área deve ser selecionada para continuar</strong>");
        return false;

    } else {
        score.submit();

    }

}
