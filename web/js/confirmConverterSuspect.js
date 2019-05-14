
function confirmConverterSuspect() {
    var converter = document.getElementById('converter');

    var answer = confirm("Deseja realmente Converter esse \n\
                            Suspect para Prospect?");
    if (answer === true) {
        converter.submit();
    } else {
        return false;
    }
}
