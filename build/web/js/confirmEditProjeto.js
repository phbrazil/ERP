
function confirmEditProjeto() {

    var projeto = document.getElementById('Projetos');

    var estado = document.getElementById('estado').value;

    if (document.getElementById('subarea').value != '' &&
            document.getElementById('contatomci').value != '' &&
            document.getElementById('propreqdate').value != '' &&
            document.getElementById('mcistdcliname').value != '' &&
            document.getElementById('projectname').value != '' &&
            document.getElementById('projectcode').value != '' &&
            document.getElementById('eventstartdate').value != '' &&
            document.getElementById('industrysector').value != '' &&
            document.getElementById('eventstatus').value != '' &&
            document.getElementById('eventclosingdate').value != '' &&
            document.getElementById('estado').value != '' &&
            document.getElementById('paxnumber').value != '' &&
            document.getElementById('cancelinsurance').value != '' &&
            document.getElementById('probability').value != '' &&
            document.getElementById('projectstatus').value != '' &&
            document.getElementById('projectaudit').value != '' &&
            document.getElementById('turnoverforowner').value != '' &&
            document.getElementById('gmforowner').value != '' &&
            document.getElementById('customertype').value != '' &&
            document.getElementById('cidade').value != '' &&
            document.getElementById('pais').value != '') {

        var answer = confirm("Confirm the Project Information?");

        if (answer === true) {

            if (estado === 'International' || estado === null || estado === '') {
                document.getElementById('estado').disabled = false;

                $(function () {
                    $('#estado').val("International");
                });
            }
            projeto.submit();
        } else {
            return false;
        }
    } else {
        alert("<br><strong>Please check the red marked mandatory fields</strong>");
        return false;
    }

}
