function limpa_formulário_Harvest() {
    //Limpa valores do formulário de cep.
    document.getElementById('client').value = ("");
    document.getElementById('name').value = ("");
    document.getElementById('code').value = ("");
    document.getElementById('is_active').value = ("");
    document.getElementById('hourly_rate').value = ("");
    document.getElementById('budget').value = ("");

}

function meu_callback(conteudo) {
    if (!("erro" in conteudo)) {
        //Atualiza os campos com os valores.
        document.getElementById('client').value = (conteudo.client);
        document.getElementById('name').value = (conteudo.name);
        document.getElementById('code').value = (conteudo.code);
        document.getElementById('is_active').value = (conteudo.is_active);
        document.getElementById('hourly_rate').value = (conteudo.hourly_rate);
        document.getElementById('budget').value = (conteudo.budget);
    } //end if.
    else {
        //CEP não Encontrado.
        limpa_formulário_Harvest()();
        alert("Projeto não encontrado.");
    }
}

function pesquisaProjeto(code) {

    if (code != "") {

        var headers = {
            'Harvest-Account-ID': '953666',
            'Authorization': 'Bearer 1645385.pt.yD2xHZREFVoR55Mq5MnekprrJL7Ze_skuWUhNXBKk2N8Ctpg4LacxN_TKC3N9IC1XjS-_Z1h5UU3_DeqiVHx7Q',
            'User-Agent': 'Harvest API Example'
        };

        var options = {
            url: 'https://api.harvestapp.com/v2/projects/18572224',
            headers: headers
        };

        alert(options)
        //Preenche os campos com "..." enquanto consulta webservice.
        document.getElementById('client').value = "...";
        document.getElementById('name').value = "...";
        document.getElementById('code').value = "...";
        document.getElementById('is_active').value = "...";
        document.getElementById('hourly_rate').value = "...";
        document.getElementById('budget').value = "...";
        //Cria um elemento javascript.
        var script = document.createElement('script');
        //Sincroniza com o callback.
        script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';
        //Insere script no documento e carrega o conteúdo.
        document.body.appendChild(script);
        //end if.
    } else {
        //cep é inválido.
        limpa_formulário_Harvest()();
        alert("Codigo inválido.");
        document.getElementById('code').value = "";
        document.getElementById('code').focus();



    }
}
;