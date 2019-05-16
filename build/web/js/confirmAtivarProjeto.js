
function confirmAtivarProjeto() {

    var ativar = document.getElementById('ativar');

    var answer = confirm("You really want activate this Project again? This will affect the reports");

    if (answer == true) {
        ativar.submit();
    } else {
        return false;
    }
}
