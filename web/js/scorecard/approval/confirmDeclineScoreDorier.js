
function confirmDeclineScoreDorier() {
       
    var aprovar = document.getElementById('aprovarscore').value;
    
    var statuscomercial = document.getElementById('statuscomercial').value;
    var statusoperacao = document.getElementById('statusoperacao').value;
    var statusfinanceiro = document.getElementById('statusfinanceiro').value;
    
    if (statuscomercial === "Pendente" || statusfinanceiro === "Pendente" ||
            statusoperacao === "Pendente") {
        alert("<br><strong>You can't decline a Scorecard with pending responses</strong>");
        return false;
    } else {
        var answer = confirm("You really want decline this Scorecard?");
        if (answer === true) {
            aprovar.submit();
        } else {
            return false;
        }
    }
}
