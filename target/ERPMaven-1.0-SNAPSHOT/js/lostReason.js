
function lostReason() {

    var projectstatus = document.getElementById('projectstatus').value;
    var probability = document.getElementById('probability').value;

    
    if (projectstatus === 'Lost' || probability === '0' || projectstatus === 'Declined') {
        document.getElementById('lostReason').style.display = 'block';


    } else {
        document.getElementById('lostReason').style.display = 'none';

    }



}


