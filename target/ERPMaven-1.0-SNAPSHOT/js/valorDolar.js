
function valorDolar(url, success) {

    var ud = '_' + +new Date,
        script = document.createElement('script'),
        head = document.getElementsByTagName('head')[0] 
               || document.documentElement;

    window[ud] = function(data) {
        head.removeChild(script);
        success && success(data);
    };

    script.src = url;
    head.appendChild(script);

}

valorDolar('https://api.hgbrasil.com/finance?format=json&key=9faa606e&format=js&callback=Resultado', function(data){
    console.log(data.Dolar.buy);
});      

