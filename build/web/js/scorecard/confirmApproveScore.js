function confirmApproveScore() {

    var aprovar = document.getElementById('aprovarscore').value;

    var answer = confirm("You really want approve this Scorecard?");
    if (answer === true) {
        aprovar.submit();
    } else {
        return false;
    }

}