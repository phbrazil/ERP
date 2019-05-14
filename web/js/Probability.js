function Probability() {

    var probability = document.getElementById('probability').value;
    if (probability > 100) {
        alert("Probabilidade não pode ser maior que 100%");
        document.getElementById('probability').value = 100;
        document.getElementById('projectstatus').value = "Won";
        document.getElementById('probability').focus();
        Calcular();
    } else if (probability > 0 && probability < 100) {
        document.getElementById('projectstatus').value = "Open";
        Calcular();
    } else if (probability === '0') {
        document.getElementById('projectstatus').value = "Lost";
        Calcular();
    } else if (probability === '100') {
        document.getElementById('projectstatus').value = "Won";
        Calcular();

    }
    
    lostReason();
}