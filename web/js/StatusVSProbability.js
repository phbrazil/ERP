function StatusVSProbability() {

    var projectstatus = document.getElementById('projectstatus').value;
    breakme: {

        if (projectstatus === "Lost" || projectstatus === "Canceled" || projectstatus === "Declined"  ) {
            document.getElementById('probability').value = 0;
            Calcular();

        } else if (projectstatus === "Won") {
            document.getElementById('probability').value = 100;
            document.getElementById('projectstatus').value = "Won";
            Calcular();

        }

    }

    lostReason();

}