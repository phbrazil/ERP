
function confirmDeleteScore() {

    var score = document.getElementById('deletarscore');


    var answer = confirm("Are you sure about this?");

    if (answer === true) {

        score.submit();
    } else {
        return false;
    }

}
