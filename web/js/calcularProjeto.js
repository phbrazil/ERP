function Calcular() {

    var turnoverforowner = document.getElementById('turnoverforowner');
    var gmforowner = document.getElementById('gmforowner');
    var probability = document.getElementById('probability');

    var Weightedprospect = converteMoedaFloat(gmforowner.value) * probability.value;

    document.Projetos.weightedprospec.value = converteFloatMoeda((Weightedprospect / 100));

    if (turnoverforowner.value === '0,00' && gmforowner.value === '0,00') {
        document.Projetos.gmturnoverperc.value = 0;
    } else {

        //VERIFICAR ARREDONDAMENTO DE PORCENTAGEM
        console.log('calculating percentage');
        document.Projetos.gmturnoverperc.value = Math.round(((converteMoedaFloat(gmforowner.value) / converteMoedaFloat(turnoverforowner.value)) * 100));

    }

    turnoverforowner = null;
    gmforowner = null;
    probability = null;


}