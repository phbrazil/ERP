function show(area) {

    if (area == 'Dorier') {
        document.getElementById('dorier').style.display = 'block';
        document.getElementById('demais').style.display = 'none';
        document.getElementById('buDorier').style.display = 'block';
        document.getElementById('buDemais').style.display = 'none';

        document.getElementById('others').name = "disabled";
        document.getElementById('dorierBu').name = "additionalclientname";

    } else {
        document.getElementById('dorier').style.display = 'none';
        document.getElementById('demais').style.display = 'block';
        document.getElementById('buDorier').style.display = 'none';
        document.getElementById('buDemais').style.display = 'block';

        document.getElementById('dorierBu').name = "disabled";
        document.getElementById('others').name = "additionalclientname";

    }

    ContatoMCI(area);

}
