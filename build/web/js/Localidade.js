function Localidade() {

    var pais = document.getElementById('pais').value;

    if (pais === "Brazil") {

        $(function () {
            $('#estado').val("São Paulo");
        });
        document.getElementById('estado').disabled = false;
        document.getElementById('estado').focus();

    } else if (pais !== "Brazil") {
        document.getElementById('estado').disabled = false;
        $(function () {
            $('#estado').val("International");
        });
        document.getElementById('estado').disabled = true;

    }
}
