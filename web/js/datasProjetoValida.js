function validaDatasProjeto() {

    var i = document.getElementById('eventstartdate').value;

    var f = document.getElementById('eventclosingdate').value;

    var dateInicio = i.split('-');
    var dateFim = f.split('-');

    var inicio = new Date(dateInicio[0], dateInicio[1], dateInicio[2]);
    var fim = new Date(dateFim[0], dateFim[1], dateFim[2]);


    var nDays = (Date.UTC(fim.getFullYear(), fim.getMonth(), fim.getDate()) -
            Date.UTC(inicio.getFullYear(), inicio.getMonth(), inicio.getDate())) / 86400000;

    if (nDays < 0) {
        alert("<br><strong>The Event Start date cannot be after the Event Closing Date</strong>");
        document.getElementById('eventclosingdate').value = null;

        document.getElementById('eventstartdate').focus();
    }

}