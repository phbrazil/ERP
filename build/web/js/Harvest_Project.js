function harvest_Code() {

    var request = require('request');

    var headers = {
        'Harvest-Account-ID': '953666',
        'Authorization': 'Bearer 1645385.pt.yD2xHZREFVoR55Mq5MnekprrJL7Ze_skuWUhNXBKk2N8Ctpg4LacxN_TKC3N9IC1XjS-_Z1h5UU3_DeqiVHx7Q',
        'User-Agent': 'Harvest API Example'
    };

    var options = {
        url: 'https://api.harvestapp.com/v2/projects/18572224',
        headers: headers
    };

    function callback(error, response, body) {
        alert("entrei no callback");
        if (!error && response.statusCode == 200) {
            console.log(body);
        }
    }

    request(options, callback);
    alert(body);
}
