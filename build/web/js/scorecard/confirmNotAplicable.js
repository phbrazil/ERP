
function confirmNotAplicable() {


    var notAplicable = document.getElementById('notaplicable');


    var answer = confirm("Are you really sure about this?");
    if (answer === true) {
        notAplicable.submit();
    } else {
        return false;
    }

}
