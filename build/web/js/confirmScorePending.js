function confirmScorePending() {
       
    var aprovar = document.getElementById('aprovarscore').value;
    
    var statuscomercial = document.getElementById('statuscomercial').value;
    var statuscriacao = document.getElementById('statuscriacao').value;
    var statusplanejamento = document.getElementById('statusplanejamento').value;
    var statusoperacao = document.getElementById('statusoperacao').value;
    var statusatendimento = document.getElementById('statusatendimento').value;
    
        
    if (statuscomercial === "Pendente" || statuscriacao === "Pendente" || 
             statusplanejamento === "Pendente" || statusoperacao === "Pendente" || 
             statusatendimento ==="Pendente") {
        alert("<br><strong>You can't approve a Scorecard with pending responses </strong>");
        return false;
    } else {
        var answer = confirm("You really want approve this Scorecard?");
        if (answer === true) {
            aprovar.submit();
        } else {
            return false;
        }
    }
}