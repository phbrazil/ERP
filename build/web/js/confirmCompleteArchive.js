
 function confirmCompleteArchive() {
    var arquivar = document.getElementById('arquivar');
    var projectstatus = document.getElementById('projectstatus').value;
    if (projectstatus === "Won" || projectstatus === "Open") {
        alert("<br><strong>You can't archive "+ projectstatus+" Projects</strong>");
        return false;   
    } else {
        var answer = confirm("You really want archive this \n\
                            project? This will affect the reports");
        if (answer === true) {
            arquivar.submit();
        } else {
            return false;
        }
    }
 }
