
function confirmCompleteScore(formname) {


    var criar = document.getElementById(formname).value;

    var file = document.getElementById('i_file').value;

    if (file === null || file === '') {
        alert('<br><strong>Please attach the Briefing file</strong>');
        return false;

    } else {
        var answer = confirm("You really want submit this scorecard?");
        if (answer === true) {
            criar.submit();
        } else {
            return false;
        }

    }



}
