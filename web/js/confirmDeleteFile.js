
function confirmDeleteFile() {

    var file = document.getElementById('file');


    var answer = confirm("Confirm de file deletion?");
    if (answer == true) {
        file.submit();
    } else {
        return false;
    }


}
