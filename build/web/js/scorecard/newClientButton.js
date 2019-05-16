function newClient(mcistdcliname) {
  
    if (mcistdcliname === '') {
        console.log('entrei no if');

        document.getElementById('newClient').style.display = 'block';
    } else {
        console.log('entrei no else');
        document.getElementById('newClient').style.display = 'none';

    }

}