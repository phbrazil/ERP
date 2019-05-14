
function confirmEditItens() {

    var projeto = document.getElementById('itens');


    var answer = confirm("Confirm the Project Information?");

    if (answer === true) {
        projeto.submit();
    } else {
        return false;
    }

}
