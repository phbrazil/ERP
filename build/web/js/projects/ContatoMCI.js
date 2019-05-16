function ContatoMCI(subarea) {

    if (subarea === "HUB" || subarea === "Services" || subarea === "PCO") {
        document.getElementById('contatomci').value = "GABRIELA CUPO";

    } else if (subarea === "Housing") {

        document.getElementById('contatomci').value = "FERNANDO PALAUSO";

    } else if (subarea === "Key Accounts") {

        document.getElementById('contatomci').value = "ANA ROBALO";

    } else if (subarea === "Dorier") {

        document.getElementById('contatomci').value = "FABIANA SOUSA";

    } else if (subarea === "Incentive/Ovation") {
        
        document.getElementById('contatomci').value = "ADRIANNE PEREIRA";

    }


}