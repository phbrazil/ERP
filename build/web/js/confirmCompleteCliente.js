
function confirmCompleteCliente() {

    var cliente = document.getElementById('cliente');

    if (document.getElementById('razaosocial').value !== '' &&
            document.getElementById('nomefantasia').value !== '' &&
            document.getElementById('cnpjcpf').value !== '' &&
            document.getElementById('phone1').value !== '' &&
            document.getElementById('contato').value !== '' &&
            document.getElementById('email').value !== '') {
        var answer = confirm("Confirma os dados do Cliente?");
        if (answer === true) {
            cliente.submit();
        }
    } else {

        alert("<br><strong>Verificar os campos obrigatórios</strong>");
        return false;
    }

}
