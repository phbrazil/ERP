
function ConfirmPassword() {

    var trocasenha = document.getElementById('trocasenha').value;

    var password = document.getElementById('password').value;
    var confirmpassword = document.getElementById('confirmpassword').value;


    if (password.length < 5) {

        alert("<br><strong>Password is too short</strong>");
        document.getElementById("password").focus();
        return false;

    } else if (password !== confirmpassword) {

        alert("<br><strong>The passwords don't match</strong>");

        document.getElementById("password").focus();
        return false;

    } else {
        var answer = confirm("Confirm the Password change?");
        if (answer == true) {
            trocasenha.submit();
        }
    }


}





